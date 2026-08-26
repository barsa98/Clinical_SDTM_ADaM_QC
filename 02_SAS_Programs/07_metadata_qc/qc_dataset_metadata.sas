*qc_dataset_metadata.sas;



options dlcreatedir;


libname sdtm "/home/u64542693/QC_codes/07_metadata_qc";

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*
PURPOSE:
Checks the metadata of the SDTM and ADaM datasets.

QC CHECKS:
1. Dataset variable names
2. Variable types
3. Variable lengths
4. Variable labels
5. Number of variables

The metadata from the SAS datasets will be extracted
for later comparison with Define-XML metadata.
*/

proc contents data=sdtm.dm
    out="/home/u64542693/SDTM_QC/metadata_dm"
    noprint;
run;

proc contents data=sdtm.ae
    out="/home/u64542693/SDTM_QC/metadata_ae"
    noprint;
run;

proc contents data=sdtm.lbch
    out="/home/u64542693/SDTM_QC/metadata_lbch"
    noprint;
run;

proc contents data=adam.adsl
    out="/home/u64542693/ADAM_QC/metadata_adsl"
    noprint;
run;

proc contents data=adam.adae
    out="/home/u64542693/ADAM_QC/metadata_adae"
    noprint;
run;

proc contents data=adam.adlbc
    out="/home/u64542693/ADAM_QC/metadata_adlbc"
    noprint;
run;

title "SDTM DM Metadata";
proc print data=metadata_dm noobs;
run;

title "SDTM AE Metadata";
proc print data=metadata_ae noobs;
run;

title "SDTM LBCH Metadata";
proc print data=metadata_lbch noobs;
run;

title "ADaM ADSL Metadata";
proc print data=metadata_adsl noobs;
run;

title "ADaM ADAE Metadata";
proc print data=metadata_adae noobs;
run;

title "ADaM ADLBC Metadata";
proc print data=metadata_adlbc noobs;
run;

title;