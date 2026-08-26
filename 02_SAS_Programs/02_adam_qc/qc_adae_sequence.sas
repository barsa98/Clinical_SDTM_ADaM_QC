libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*
PURPOSE:
Checks whether ADAE records have valid sequence numbers.

QC CHECKS:
1. Identifies duplicate ASEQ values within USUBJID.
2. Identifies missing ASEQ values.

EXPECTED RESULT:
ASEQ should be populated and unique within each subject.
*/

proc sql;

    create table qc_adae_duplicate_seq as
    select usubjid,
           aseq,
           count(*) as record_count
    from adam.adae
    group by usubjid, aseq
    having count(*) > 1;

    create table qc_adae_missing_seq as
    select *
    from adam.adae
    where missing(aseq);

quit;

title "ADAE Duplicate ASEQ Check";
proc print data=qc_adae_duplicate_seq noobs;
run;

title "ADAE Missing ASEQ Check";
proc print data=qc_adae_missing_seq noobs;
run;

title;