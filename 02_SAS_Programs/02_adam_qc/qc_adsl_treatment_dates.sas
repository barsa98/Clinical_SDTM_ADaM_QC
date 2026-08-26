*qc_adsl_treatment_dates.sas;


libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";



/*
PURPOSE:
Checks treatment dates against the subject reference dates.

QC CHECK:
Identifies records where treatment start occurs before
the reference start date or treatment end occurs before
treatment start.
*/

proc sql;

    create table qc_adsl_treatment_dates as
    select *
    from adam.adsl
    where (not missing(trtsdt) and not missing(rfstdtc)
           and trtsdt < rfstdtc)
       or (not missing(trtsdt) and not missing(trtedt)
           and trtedt < trtsdt);

quit;

title "ADSL Treatment Date Check";
proc print data=qc_adsl_treatment_dates noobs;
run;
title;