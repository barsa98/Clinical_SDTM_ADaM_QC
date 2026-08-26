* qc_ae_to_dm.sas;


*options dlcreatedir;

*libname qc_trace "/home/u64542693/QC_codes/03_traceability";

/*
PURPOSE:
Checks referential integrity between the SDTM AE
(Adverse Events) and DM (Demographics) datasets.

QC CHECK:
Identifies AE records whose USUBJID does not exist in DM.

EXPECTED RESULT:
Every subject with an adverse event should exist in DM.

This ensures that AE records can be linked back to a valid
subject-level record.
*/



libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


proc sql;

    create table qc_ae_orphans as
    select distinct
           a.usubjid
    from sdtm.ae as a
    left join sdtm.dm as d
        on a.usubjid = d.usubjid
    where missing(d.usubjid);

quit;

title "AE Subjects Not Found in DM";

proc print data=qc_ae_orphans noobs;
run;

title;