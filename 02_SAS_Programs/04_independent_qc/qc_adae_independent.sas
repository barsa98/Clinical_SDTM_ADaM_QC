*qc_adae_independent.sas;


libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";



/*
PURPOSE:
Independently checks ADAE against the source SDTM AE dataset.
*/

proc sql;

    create table qc_adae_independent as
    select
        a.usubjid,
        a.aeseq,
        a.aeterm,
        e.aeterm as sdtm_aeterm,
        a.aeser,
        e.aeser as sdtm_aeser
    from adam.adae as a
    left join sdtm.ae as e
        on a.usubjid = e.usubjid
       and a.aeseq = e.aeseq;

quit;

data qc_adae_independent;
    set qc_adae_independent;

    length traceability_check $4;

    if not missing(sdtm_aeterm) and aeterm = sdtm_aeterm
       then traceability_check = "PASS";
    else traceability_check = "FAIL";
run;

title "Independent ADAE QC";
proc print data=qc_adae_independent noobs;
run;
title;