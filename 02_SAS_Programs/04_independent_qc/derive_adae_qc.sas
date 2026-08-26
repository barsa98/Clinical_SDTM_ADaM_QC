*derive_adae_qc.sas;

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*
PURPOSE:
Independently derives key ADAE QC variables from SDTM AE.
*/

proc sql;

    create table qc_adae_derived as
    select
        a.studyid,
        a.usubjid,
        a.aeseq,
        a.aeterm,
        a.aeser
    from sdtm.ae as a;

quit;

proc sort data=qc_adae_derived;
    by usubjid aeseq;
run;

proc sort data=adam.adae out=adae_sorted;
    by usubjid aeseq;
run;