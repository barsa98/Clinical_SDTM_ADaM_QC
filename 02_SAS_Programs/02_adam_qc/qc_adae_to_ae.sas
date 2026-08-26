*qc_adae_to_ae.sas;


libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*
PURPOSE:
Checks whether every ADAE record can be traced to
a corresponding SDTM AE record.
*/

proc sql;

    create table qc_adae_orphans as
    select distinct
           a.usubjid,
           a.aeseq
    from adam.adae as a
    left join sdtm.ae as e
        on a.usubjid = e.usubjid
       and a.aeseq = e.aeseq
    where missing(e.usubjid);

quit;

title "ADAE Records Not Found in AE";
proc print data=qc_adae_orphans noobs;
run;
title;