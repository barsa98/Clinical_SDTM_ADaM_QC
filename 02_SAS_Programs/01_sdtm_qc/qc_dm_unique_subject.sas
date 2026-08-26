/* qc_dm_unique_subject.sas */

*options dlcreatedir;

*libname qc_dm "/home/u64542693/QC_codes/01_sdtm_qc";

/*=============================================================
Program: qc_dm_unique_subject.sas
Purpose: Check that DM contains one record per USUBJID
=============================================================*/

/*
PURPOSE:
Checks whether the SDTM DM (Demographics) dataset contains
exactly one record for each subject.

QC CHECKS:
1. Identifies subjects with duplicate USUBJID values.
2. Identifies records where USUBJID is missing.

EXPECTED RESULT:
No duplicate USUBJID values and no missing USUBJID values.

USUBJID is the unique subject identifier used to link
subjects across clinical-trial datasets.
*/



libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


proc sql;

    create table qc_dm_duplicate_subjects as
    select usubjid,
           count(*) as record_count
    from sdtm.dm
    group by usubjid
    having count(*) > 1;

    create table qc_dm_missing_usubjid as
    select *
    from sdtm.dm
    where missing(usubjid);

quit;



title "DM Duplicate USUBJID Check";
proc print data=qc_dm_duplicate_subjects;
run;



title "DM Missing USUBJID Check";
proc print data=qc_dm_missing_usubjid;
run;

title;


