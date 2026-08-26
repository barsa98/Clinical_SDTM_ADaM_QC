
*compare_adlbc.sas;


libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*
PURPOSE:
Compares independently derived ADLBC QC variables
with the corresponding variables in ADLBC.
*/

proc compare
    base=adlbc_sorted
    compare=qc_adlbc_derived
    out=qc_adlbc_compare
    outnoequal;
run;