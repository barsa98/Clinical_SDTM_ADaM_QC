
libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*
PURPOSE:
Checks whether important AE variables are populated.

QC CHECK:
Identifies AE records where key variables are missing.

VARIABLES CHECKED:
STUDYID, DOMAIN, USUBJID, AESEQ, AETERM

EXPECTED RESULT:
Required AE identification variables should not be missing.
*/

proc sql;

    create table qc_ae_required as
    select *
    from sdtm.ae
    where missing(studyid)
       or missing(domain)
       or missing(usubjid)
       or missing(aeseq)
       or missing(aeterm);

quit;

title "AE Required Variable Check";

proc print data=qc_ae_required noobs;
run;

title;