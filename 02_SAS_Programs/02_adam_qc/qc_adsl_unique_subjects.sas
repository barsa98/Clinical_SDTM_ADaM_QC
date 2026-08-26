/* qc_adsl_unique_subject.sas */

*options dlcreatedir;

*libname qc_adam "/home/u64542693/QC_codes/02_adam_qc";

/*=============================================================
Program: qc_adsl_to_dm.sas
Purpose: Verify that every ADSL subject exists in DM
=============================================================*/

/*
PURPOSE:
Checks whether the ADaM ADSL (Subject-Level Analysis Dataset)
contains exactly one record for each subject.

QC CHECKS:
1. Identifies duplicate USUBJID values.
2. Identifies missing USUBJID values.
3. Creates a summary of the number of errors found.

EXPECTED RESULT:
One ADSL record per subject and no missing USUBJID values.
*/

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";



proc sql;

    create table qc_adsl_duplicate_subjects as
    select usubjid,
           count(*) as record_count
    from adam.adsl
    group by usubjid
    having count(*) > 1;

    create table qc_adsl_missing_usubjid as
    select *
    from adam.adsl
    where missing(usubjid);

    create table qc_adsl_summary as
    select "ADSL" as dataset length=20,
           "Unique USUBJID" as check_name length=40,
           count(*) as error_count
    from qc_adsl_duplicate_subjects

    union all

    select "ADSL",
           "Missing USUBJID",
           count(*)
    from qc_adsl_missing_usubjid;

quit;

title "ADSL Duplicate USUBJID Check";
proc print data=qc_adsl_duplicate_subjects;
run;

title "ADSL Missing USUBJID Check";
proc print data=qc_adsl_missing_usubjid;
run;

title "ADSL QC Summary";
proc print data=qc_adsl_summary noobs;
run;

title;