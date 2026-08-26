*qc_adae_required_variables.sas;

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*
PURPOSE:
Checks important ADAE variables for missing values.
*/

proc sql;

    create table qc_adae_required as
    select *
    from adam.adae
    where missing(usubjid)
       or missing(aeseq);

quit;

title "ADAE Required Variable Check";
proc print data=qc_adae_required noobs;
run;
title;