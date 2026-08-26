*qc_ae_usubjid.sas;

/*
PURPOSE:
Checks whether the SDTM AE dataset contains a valid
USUBJID for every adverse-event record.

QC CHECK:
Identifies AE records where USUBJID is missing.

EXPECTED RESULT:
No AE records should have a missing USUBJID.

USUBJID allows each adverse event to be linked to the
corresponding subject in DM and other clinical datasets.
*/


libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


proc sql;

    create table qc_ae_missing_usubjid as
    select *
    from sdtm.ae
    where missing(usubjid);

quit;

title "AE Missing USUBJID Check";

proc print data=qc_ae_missing_usubjid noobs;
run;

title;