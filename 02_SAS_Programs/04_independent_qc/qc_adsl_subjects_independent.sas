
*qc_adsl_subjects_independent.sas;

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*
PURPOSE:
Independently verifies that every ADSL subject exists in DM.
*/

proc sql;

    create table qc_adsl_subjects_independent as
    select
        a.usubjid,
        case
            when d.usubjid is not null then "PASS"
            else "FAIL"
        end as subject_check length=4
    from adam.adsl as a
    left join sdtm.dm as d
        on a.usubjid = d.usubjid;

quit;

title "Independent ADSL Subject QC";
proc print data=qc_adsl_subjects_independent noobs;
run;
title;