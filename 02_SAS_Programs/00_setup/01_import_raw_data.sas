/* 01_import_raw_data.sas */

/* 
PURPOSE:
Imports the raw SDTM and ADaM CSV datasets into SAS libraries.

WHAT THIS PROGRAM DOES:
1. Creates/assigns the SDTM and ADaM SAS libraries.
2. Imports the selected CSV files into SAS datasets.
3. Uses PROC CONTENTS to inspect dataset structure and metadata.
4. Generates a basic inventory showing the number of observations
   and variables in each dataset.

DATASETS IMPORTED:
SDTM: DM, AE, LBCH
ADaM: ADSL, ADAE, ADLBC

This program prepares the data for subsequent QC checks.
*/

options dlcreatedir;

libname qc "/home/u64542693/QC_codes/00_setup";


libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";

proc import datafile="/home/u64542693/SDTM_QC/dm.csv"
    out=sdtm.dm dbms=csv replace;
    guessingrows=max;
    getnames=yes;
run;

proc import datafile="/home/u64542693/SDTM_QC/ae.csv"
    out=sdtm.ae dbms=csv replace;
    guessingrows=max;
    getnames=yes;
run;

proc import datafile="/home/u64542693/SDTM_QC/lbch.csv"
    out=sdtm.lbch dbms=csv replace;
    guessingrows=max;
    getnames=yes;
run;

proc import datafile="/home/u64542693/ADAM_QC/adsl.csv"
    out=adam.adsl dbms=csv replace;
    guessingrows=max;
    getnames=yes;
run;

proc import datafile="/home/u64542693/ADAM_QC/adae.csv"
    out=adam.adae dbms=csv replace;
    guessingrows=max;
    getnames=yes;
run;

proc import datafile="/home/u64542693/ADAM_QC/adlbc.csv"
    out=adam.adlbc dbms=csv replace;
    guessingrows=max;
    getnames=yes;
run;

proc contents data=sdtm._all_;
run;

proc contents data=adam._all_;
run;

proc sql;
    title "SDTM Dataset Inventory";
    select memname, nobs, nvar
    from dictionary.tables
    where libname="SDTM"
    order by memname;

    title "ADaM Dataset Inventory";
    select memname, nobs, nvar
    from dictionary.tables
    where libname="ADAM"
    order by memname;
quit;