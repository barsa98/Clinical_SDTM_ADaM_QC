*qc_adsl_population_flags.sas;


libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*
PURPOSE:
Checks ADSL analysis population flags.

QC CHECK:
Identifies unexpected values in SAFFL, ITTFL and EFFFL.
Expected values are Y, N, or blank.
*/

proc sql;

    create table qc_adsl_population_flags as
    select *
    from adam.adsl
    where saffl not in ("Y","N","")
       or ittfl not in ("Y","N","")
       or efffl not in ("Y","N","");

quit;

title "ADSL Population Flag Check";
proc print data=qc_adsl_population_flags noobs;
run;
title;