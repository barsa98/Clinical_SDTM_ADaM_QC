*qc_lbch_to_dm.sas;


/*
PURPOSE:
Checks referential integrity between the SDTM LBCH
(Clinical Chemistry Laboratory) and DM datasets.

QC CHECK:
Identifies LBCH records whose USUBJID does not exist in DM.

EXPECTED RESULT:
Every subject represented in LBCH should have a corresponding
subject record in DM.

This ensures that laboratory chemistry records can be traced
back to a valid clinical-trial subject.
*/

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";

proc sql;

    create table qc_lbch_orphans as
    select distinct
           l.usubjid
    from sdtm.lbch as l
    left join sdtm.dm as d
        on l.usubjid = d.usubjid
    where missing(d.usubjid);

quit;

title "LBCH Subjects Not Found in DM";

proc print data=qc_lbch_orphans noobs;
run;

title;