*qc_adae_to_adsl.sas;

/*
PURPOSE:
Checks referential integrity between the ADaM ADAE
(Adverse Event Analysis) and ADSL datasets.

QC CHECK:
Identifies ADAE records whose USUBJID does not exist in ADSL.

EXPECTED RESULT:
Every ADAE subject should have a corresponding ADSL record.

This ensures that adverse-event analysis records can be
linked to the subject-level analysis dataset.
*/

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";



proc sql;

    create table qc_adae_orphans as
    select distinct
           a.usubjid
    from adam.adae as a
    left join adam.adsl as s
        on a.usubjid = s.usubjid
    where missing(s.usubjid);

quit;

title "ADAE Subjects Not Found in ADSL";

proc print data=qc_adae_orphans noobs;
run;

title;