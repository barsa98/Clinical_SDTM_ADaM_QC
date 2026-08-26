*qc_adlbc_independent.sas;


libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*
PURPOSE:
Independently checks whether ADLBC laboratory records
can be traced to SDTM LBCH.
*/

proc sql;

    create table qc_adlbc_independent as
    select
        a.usubjid,
        a.lbtestcd,
        a.lbseq,
        l.lbtestcd as sdtm_lbtestcd,
        l.lbseq as sdtm_lbseq
    from adam.adlbc as a
    left join sdtm.lbch as l
        on a.usubjid = l.usubjid
       and a.lbtestcd = l.lbtestcd;

quit;

data qc_adlbc_independent;
    set qc_adlbc_independent;

    length traceability_check $4;

    if not missing(sdtm_lbtestcd)
       then traceability_check = "PASS";
    else traceability_check = "FAIL";
run;

title "Independent ADLBC QC";
proc print data=qc_adlbc_independent noobs;
run;
title;