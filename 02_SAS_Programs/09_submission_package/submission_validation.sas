*submission_validation.sas;

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";



/*
PURPOSE:
Performs final basic validation checks on the datasets
selected for the mock submission package.
*/

proc sql;

    create table submission_validation as

    select "SDTM.DM" as dataset length=20,
           count(*) as observations
    from sdtm.dm

    union all

    select "SDTM.AE",
           count(*)
    from sdtm.ae

    union all

    select "SDTM.LBCH",
           count(*)
    from sdtm.lbch

    union all

    select "ADAM.ADSL",
           count(*)
    from adam.adsl

    union all

    select "ADAM.ADAE",
           count(*)
    from adam.adae

    union all

    select "ADAM.ADLBC",
           count(*)
    from adam.adlbc;

quit;

title "Final Submission Dataset Validation";

proc print data=submission_validation noobs;
run;

title;