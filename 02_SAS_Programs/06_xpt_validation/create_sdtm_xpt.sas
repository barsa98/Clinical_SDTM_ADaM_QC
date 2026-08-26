*create_sdtm_xpt.sas;

options dlcreatedir;


libname xpt "/home/u64542693/QC_codes/06_xpt_validation";


libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*
PURPOSE:
Creates SAS transport (XPT) files for the SDTM datasets.

The XPT format is commonly used for transferring clinical
trial datasets for regulatory submission and review.
*/

libname xptdm xport "/home/u64542693/SDTM_QC/dm.xpt";
libname xptae xport "/home/u64542693/SDTM_QC/ae.xpt";
libname xptlb xport "/home/u64542693/SDTM_QC/lbch.xpt";

data xptdm.dm;
    set sdtm.dm;
run;

data xptae.ae;
    set sdtm.ae;
run;

data xptlb.lbch;
    set sdtm.lbch;
run;

libname xptdm clear;
libname xptae clear;
libname xptlb clear;