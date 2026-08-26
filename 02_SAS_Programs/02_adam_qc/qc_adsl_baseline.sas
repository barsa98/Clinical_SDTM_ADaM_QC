*qc_adsl_baseline.sas;

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*
PURPOSE:
Checks baseline variables in ADSL.

QC CHECK:
Identifies subjects with missing baseline height or weight.
*/

proc sql;

    create table qc_adsl_baseline as
    select *
    from adam.adsl
    where missing(heightbl)
       or missing(weightbl);

quit;

title "ADSL Baseline Variable Check";
proc print data=qc_adsl_baseline noobs;
run;
title;