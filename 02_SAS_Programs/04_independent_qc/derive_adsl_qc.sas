
*derive_adsl_qc.sas;

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";

/*
PURPOSE:
Independently derives a subject-level QC dataset from SDTM DM
for comparison with the submitted ADaM ADSL dataset.
*/

proc sql;

    create table qc_adsl_derived as
    select
        d.studyid,
        d.usubjid,
        d.subjid,
        d.siteid,
        d.age,
        d.ageu,
        d.sex,
        d.race,
        d.ethnic,
        d.arm,
        d.armcd,
        d.rfstdtc,
        d.rfendtc
    from sdtm.dm as d;

quit;

proc sort data=qc_adsl_derived;
    by usubjid;
run;

proc sort data=adam.adsl out=adsl_sorted;
    by usubjid;
run;