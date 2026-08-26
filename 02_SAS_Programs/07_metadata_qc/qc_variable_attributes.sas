*qc_variable_attributes.sas;


libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*
PURPOSE:
Checks variable attributes in the SDTM and ADaM datasets.

QC CHECKS:
1. Variable name
2. Variable type
3. Variable length
4. Format
5. Informat
*/

proc contents data=sdtm.dm out=qc_dm_attributes noprint;
run;

proc contents data=sdtm.ae out=qc_ae_attributes noprint;
run;

proc contents data=sdtm.lbch out=qc_lbch_attributes noprint;
run;

proc contents data=adam.adsl out=qc_adsl_attributes noprint;
run;

proc contents data=adam.adae out=qc_adae_attributes noprint;
run;

proc contents data=adam.adlbc out=qc_adlbc_attributes noprint;
run;

title "DM Variable Attributes";
proc print data=qc_dm_attributes noobs;
    var name type length format informat;
run;

title "AE Variable Attributes";
proc print data=qc_ae_attributes noobs;
    var name type length format informat;
run;

title "LBCH Variable Attributes";
proc print data=qc_lbch_attributes noobs;
    var name type length format informat;
run;

title "ADSL Variable Attributes";
proc print data=qc_adsl_attributes noobs;
    var name type length format informat;
run;

title "ADAE Variable Attributes";
proc print data=qc_adae_attributes noobs;
    var name type length format informat;
run;

title "ADLBC Variable Attributes";
proc print data=qc_adlbc_attributes noobs;
    var name type length format informat;
run;

title;