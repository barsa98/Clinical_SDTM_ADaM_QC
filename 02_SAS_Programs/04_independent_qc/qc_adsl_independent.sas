*qc_adsl_independent.sas;

*options dlcreatedir;


*libname ind_qc "/home/u64542693/QC_codes/04_independent_qc";

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*
PURPOSE:
Independently derives key subject-level variables from SDTM DM
and compares them with the corresponding ADSL variables.

QC APPROACH:
1. Select subject-level information from DM.
2. Independently derive treatment information.
3. Compare the independently derived values with ADSL.
*/

proc sql;

    create table qc_adsl_independent as
    select
        d.usubjid,
        d.studyid,
        d.subjid,
        d.siteid,
        d.sex,
        d.age,
        d.ageu,
        d.race,
        d.ethnic,
        d.arm as qc_trt01p,
        d.armcd as qc_trt01pn,
        a.trt01p,
        a.trt01pn
    from sdtm.dm as d
    left join adam.adsl as a
        on d.usubjid = a.usubjid;

quit;

data qc_adsl_independent;
    set qc_adsl_independent;

    length treatment_check $4;

    if qc_trt01p = trt01p and qc_trt01pn = trt01pn then
        treatment_check = "PASS";
    else
        treatment_check = "FAIL";
run;

title "Independent ADSL Treatment QC";

proc print data=qc_adsl_independent noobs;
run;

title;



/* proc print data=sdtm.dm; */
/* var usubjid arm armcd trt01p trt01pn; */
/* run; */
/*  */
/*  */
/* data merged_dm_sdtm; */
/* merge sdtm.dm(in=a) adam.adsl(in=b); */
/* if a and b; */
/* keep usubjid arm armcd trt01p trt01pn; */
/* run; */

