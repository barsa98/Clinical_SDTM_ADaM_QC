*traceability_matrix.sas;


options dlcreatedir;


libname ftrace "/home/u64542693/QC_codes/08_final_traceability";


libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";

/*
PURPOSE:
Creates a final traceability matrix showing how ADaM datasets
are linked to their SDTM source datasets.

This provides a high-level view of data lineage for QC
and submission review.
*/

data traceability_matrix;

    length adam_dataset $10
           adam_variable $20
           sdtm_dataset $10
           sdtm_variable $20
           relationship $60;

    adam_dataset = "ADSL";
    adam_variable = "USUBJID";
    sdtm_dataset = "DM";
    sdtm_variable = "USUBJID";
    relationship = "Subject identifier";
    output;

    adam_dataset = "ADAE";
    adam_variable = "USUBJID";
    sdtm_dataset = "AE";
    sdtm_variable = "USUBJID";
    relationship = "Subject identifier";
    output;

    adam_dataset = "ADAE";
    adam_variable = "AESEQ";
    sdtm_dataset = "AE";
    sdtm_variable = "AESEQ";
    relationship = "Adverse event record traceability";
    output;

    adam_dataset = "ADLBC";
    adam_variable = "USUBJID";
    sdtm_dataset = "LBCH";
    sdtm_variable = "USUBJID";
    relationship = "Subject identifier";
    output;

    adam_dataset = "ADLBC";
    adam_variable = "LBSEQ";
    sdtm_dataset = "LBCH";
    sdtm_variable = "LBSEQ";
    relationship = "Laboratory record traceability";
    output;

run;

title "Final ADaM to SDTM Traceability Matrix";

proc print data=traceability_matrix noobs;
run;

title;