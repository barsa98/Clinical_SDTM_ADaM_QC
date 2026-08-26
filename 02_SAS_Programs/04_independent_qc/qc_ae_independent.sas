
*qc_ae_independent.sas;


libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*
PURPOSE:
Independently verifies that every AE subject exists in DM
and that AESEQ is populated.
*/

proc sql;

    create table qc_ae_independent as
    select
        a.usubjid,
        a.aeseq,
        case
            when d.usubjid is not null
             and not missing(a.aeseq)
            then "PASS"
            else "FAIL"
        end as qc_status length=4
    from sdtm.ae as a
    left join sdtm.dm as d
        on a.usubjid = d.usubjid;

quit;

title "Independent AE QC";
proc print data=qc_ae_independent noobs;
run;
title;

