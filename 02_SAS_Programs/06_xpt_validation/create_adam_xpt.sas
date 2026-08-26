*create_adam_xpt.sas;

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";

/*
PURPOSE:
Creates SAS transport (XPT) files for the ADaM datasets.
*/

libname xptadsl xport "/home/u64542693/ADAM_QC/adsl.xpt";
libname xptadae xport "/home/u64542693/ADAM_QC/adae.xpt";
libname xptadlbc xport "/home/u64542693/ADAM_QC/adlbc.xpt";

data xptadsl.adsl;
    set adam.adsl;
run;

data xptadae.adae;
    set adam.adae;
run;

data xptadlbc.adlbc;
    set adam.adlbc;
run;

libname xptadsl clear;
libname xptadae clear;
libname xptadlbc clear;