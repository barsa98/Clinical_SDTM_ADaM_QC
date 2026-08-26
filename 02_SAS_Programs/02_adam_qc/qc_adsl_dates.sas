*qc_adsl_dates.sas;

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*
PURPOSE:
Checks the logical order of important ADSL dates.
*/

proc sql;

    create table qc_adsl_invalid_dates as
    select *
    from adam.adsl
    where (not missing(trtsdt) and not missing(trtedt)
           and trtedt < trtsdt)
       or (not missing(rfstdtc) and not missing(rfendtc)
           and rfendtc < rfstdtc);

quit;

title "ADSL Date Validation Check";
proc print data=qc_adsl_invalid_dates noobs;
run;
title;