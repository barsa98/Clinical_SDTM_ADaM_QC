
libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*
PURPOSE:
Checks whether important LBCH variables are populated.

QC CHECK:
Identifies LBCH records where key laboratory variables are missing.

VARIABLES CHECKED:
STUDYID, DOMAIN, USUBJID, LBSEQ, LBTESTCD, LBORRES

EXPECTED RESULT:
Required laboratory identification and result variables
should not be missing.
*/

proc sql;

    create table qc_lbch_required as
    select *
    from sdtm.lbch
    where missing(studyid)
       or missing(domain)
       or missing(usubjid)
       or missing(lbseq)
       or missing(lbtestcd)
       or missing(lborres);

quit;

title "LBCH Required Variable Check";

proc print data=qc_lbch_required noobs;
run;

title;