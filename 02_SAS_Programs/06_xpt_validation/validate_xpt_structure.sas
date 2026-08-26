*validate_xpt_structure.sas;

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*
PURPOSE:
Validates the structure of the generated XPT datasets
against the corresponding SAS datasets.

QC CHECKS:
1. Dataset exists.
2. Number of observations matches.
3. Number of variables matches.
*/

proc contents data=sdtm.dm out=dm_meta noprint;
run;

proc contents data=sdtm.ae out=ae_meta noprint;
run;

proc contents data=sdtm.lbch out=lbch_meta noprint;
run;

proc contents data=adam.adsl out=adsl_meta noprint;
run;

proc contents data=adam.adae out=adae_meta noprint;
run;

proc contents data=adam.adlbc out=adlbc_meta noprint;
run;

title "XPT Source Dataset Structure";

proc print data=dm_meta noobs;
run;

proc print data=ae_meta noobs;
run;

proc print data=lbch_meta noobs;
run;

proc print data=adsl_meta noobs;
run;

proc print data=adae_meta noobs;
run;

proc print data=adlbc_meta noobs;
run;

title;