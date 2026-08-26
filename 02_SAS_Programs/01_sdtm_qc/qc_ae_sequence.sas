*qc_ae_sequence.sas;

/*
PURPOSE:
Checks the AESEQ variable in the SDTM AE dataset.

QC CHECKS:
1. Identifies duplicate AESEQ values within the same USUBJID.
2. Identifies AE records with a missing AESEQ.

EXPECTED RESULT:
Each AE record should have a non-missing AESEQ that is
unique within each subject.

AESEQ provides a sequence number for uniquely identifying
adverse-event records within a subject.
*/

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


proc sql;

    create table qc_ae_duplicate_seq as
    select usubjid,
           aeseq,
           count(*) as record_count
    from sdtm.ae
    group by usubjid, aeseq
    having count(*) > 1;

    create table qc_ae_missing_seq as
    select *
    from sdtm.ae
    where missing(aeseq);

quit;

title "AE Duplicate AESEQ Check";
proc print data=qc_ae_duplicate_seq noobs;
run;

title "AE Missing AESEQ Check";
proc print data=qc_ae_missing_seq noobs;
run;

title;