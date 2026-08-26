
*qc_adlbc_to_adsl.sas;

/*
PURPOSE:
Checks referential integrity between the ADaM ADLBC
(Laboratory Chemistry Analysis) and ADSL datasets.

QC CHECK:
Identifies ADLBC records whose USUBJID does not exist in ADSL.

EXPECTED RESULT:
Every ADLBC subject should have a corresponding ADSL record.

This ensures that laboratory analysis records can be linked
to the subject-level analysis dataset.
*/

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";



proc sql;

    create table qc_adlbc_orphans as
    select distinct
           a.usubjid
    from adam.adlbc as a
    left join adam.adsl as s
        on a.usubjid = s.usubjid
    where missing(s.usubjid);

quit;

title "ADLBC Subjects Not Found in ADSL";

proc print data=qc_adlbc_orphans noobs;
run;

title;