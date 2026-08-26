


libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*
PURPOSE:
Checks whether important required DM variables are populated.

QC CHECK:
Identifies DM records where key variables are missing.

VARIABLES CHECKED:
STUDYID, DOMAIN, USUBJID, SUBJID, SEX, AGE, AGEU

EXPECTED RESULT:
Required subject-level information should not be missing.
*/

proc sql;

    create table qc_dm_required as
    select *
    from sdtm.dm
    where missing(studyid)
       or missing(domain)
       or missing(usubjid)
       or missing(subjid)
       or missing(sex)
       or missing(age)
       or missing(ageu);

quit;

title "DM Required Variable Check";

proc print data=qc_dm_required noobs;
run;

title;