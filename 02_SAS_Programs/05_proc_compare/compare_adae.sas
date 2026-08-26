*compare_adae.sas;

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*
PURPOSE:
Compares independently derived ADAE QC variables
with the corresponding variables in ADAE.
*/

proc compare
    base=adae_sorted
    compare=qc_adae_derived
    out=qc_adae_compare
    outnoequal;
run;