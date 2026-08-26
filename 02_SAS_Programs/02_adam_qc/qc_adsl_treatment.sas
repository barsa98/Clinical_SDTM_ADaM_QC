
*qc_adsl_treatment.sas;

/*
PURPOSE:
Checks consistency of treatment information between
ADaM ADSL and SDTM DM.

QC CHECK:
Compares treatment variables in ADSL with treatment/arm
information in DM for the same USUBJID.

VARIABLES COMPARED:
ADSL: TRT01P, TRT01PN, TRT01A, TRT01AN
DM:   ARM, ARMCD

EXPECTED RESULT:
Treatment information should be consistent between the
subject-level analysis dataset and the corresponding
SDTM subject-level data.

Any differences identified by this program require review
to determine whether they are expected derivations or errors.
*/

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


proc sql;

    create table qc_adsl_treatment as
    select a.usubjid,
           a.trt01p,
           a.trt01pn,
           a.trt01a,
           a.trt01an,
           d.arm,
           d.armcd
    from adam.adsl as a
    left join sdtm.dm as d
        on a.usubjid = d.usubjid
    where a.trt01p ne d.arm
       or a.trt01pn ne d.armcd;

quit;

title "ADSL Treatment Consistency Check";

proc print data=qc_adsl_treatment noobs;
run;

title;