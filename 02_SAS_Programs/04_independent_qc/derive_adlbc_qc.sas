*derive_adlbc_qc.sas;


libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";
/*
PURPOSE:
Independently derives key ADLBC QC variables from SDTM LBCH.
*/

proc sql;

    create table qc_adlbc_derived as
    select
        l.studyid,
        l.usubjid,
        l.lbseq,
        l.lbtestcd,
        l.lborres,
        l.lborresu
    from sdtm.lbch as l;

quit;

proc sort data=qc_adlbc_derived;
    by usubjid lbseq;
run;

proc sort data=adam.adlbc out=adlbc_sorted;
    by usubjid lbseq;
run;