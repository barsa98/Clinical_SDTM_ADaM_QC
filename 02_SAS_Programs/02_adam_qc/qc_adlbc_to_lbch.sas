*qc_adlbc_to_lbch.sas;

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*
PURPOSE:
Checks whether ADLBC records can be traced to SDTM LBCH.
*/

proc sql;

    create table qc_adlbc_orphans as
    select distinct
           a.usubjid
    from adam.adlbc as a
    left join sdtm.lbch as l
        on a.usubjid = l.usubjid
    where missing(l.usubjid);

quit;

title "ADLBC Subjects Not Found in LBCH";
proc print data=qc_adlbc_orphans noobs;
run;
title;