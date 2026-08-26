*compare_adsl.sas;

*options dlcreatedir;


*libname prc "/home/u64542693/QC_codes/05_proc_compare";

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";

/*
PURPOSE:
Compares independently derived ADSL QC variables
with the corresponding variables in ADSL.
*/

proc compare
    base=adsl_sorted
    compare=qc_adsl_derived
    out=qc_adsl_compare
    outnoequal;
run;