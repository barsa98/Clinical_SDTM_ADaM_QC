/* qc_adsl_to_dm.sas */

*options dlcreatedir;

*libname qc_trace "/home/u64542693/QC_codes/03_traceability";

/*
PURPOSE:
Checks traceability between the ADaM ADSL dataset and
the SDTM DM dataset.

QC CHECK:
Checks whether every subject present in ADSL can be found
in the SDTM DM dataset using USUBJID.

EXPECTED RESULT:
Every ADSL subject should have a corresponding DM record.

This demonstrates basic ADaM-to-SDTM subject-level traceability.
*/


libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";



proc sql;

    create table qc_adsl_orphans as
    select distinct
           a.usubjid
    from adam.adsl as a
    left join sdtm.dm as d
        on a.usubjid = d.usubjid
    where missing(d.usubjid);

quit;

title "ADSL Subjects Not Found in DM";

proc print data=qc_adsl_orphans noobs;
run;

title;