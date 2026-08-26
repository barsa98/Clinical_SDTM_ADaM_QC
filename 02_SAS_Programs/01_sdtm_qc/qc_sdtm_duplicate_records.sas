*qc_sdtm_duplicate_records.sas;

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*
PURPOSE:
Checks for completely duplicated records in the selected
SDTM datasets.

QC CHECK:
Identifies duplicate records in DM, AE, and LBCH.

EXPECTED RESULT:
No completely duplicated records should be present.
*/

proc sort data=sdtm.dm out=dm_check nodupkey dupout=qc_dm_duplicates;
    by _all_;
run;

proc sort data=sdtm.ae out=ae_check nodupkey dupout=qc_ae_duplicates;
    by _all_;
run;

proc sort data=sdtm.lbch out=lbch_check nodupkey dupout=qc_lbch_duplicates;
    by _all_;
run;

title "DM Duplicate Records";
proc print data=qc_dm_duplicates noobs;
run;

title "AE Duplicate Records";
proc print data=qc_ae_duplicates noobs;
run;

title "LBCH Duplicate Records";
proc print data=qc_lbch_duplicates noobs;
run;

title;