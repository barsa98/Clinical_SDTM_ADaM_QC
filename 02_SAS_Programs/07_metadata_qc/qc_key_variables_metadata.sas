*qc_key_variables_metadata.sas;

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*
PURPOSE:
Checks metadata for important SDTM and ADaM key variables.

QC CHECK:
Identifies key variables with missing labels or unexpected
variable types.

KEY VARIABLES:
SDTM: USUBJID, AESEQ, LBSEQ
ADaM: USUBJID, AETERM, TRT01A, TRT01AN
*/

proc sql;

    create table qc_key_metadata as
    select "SDTM.DM" as dataset length=20,
           name,
           type,
           length,
           label
    from metadata_dm
    where upcase(name) in ("USUBJID")

    union all

    select "SDTM.AE",
           name,
           type,
           length,
           label
    from metadata_ae
    where upcase(name) in ("USUBJID","AESEQ")

    union all

    select "SDTM.LBCH",
           name,
           type,
           length,
           label
    from metadata_lbch
    where upcase(name) in ("USUBJID","LBSEQ")

    union all

    select "ADAM.ADSL",
           name,
           type,
           length,
           label
    from metadata_adsl
    where upcase(name) in ("USUBJID","TRT01A","TRT01AN")

    union all

    select "ADAM.ADAE",
           name,
           type,
           length,
           label
    from metadata_adae
    where upcase(name) in ("USUBJID","AETERM");

quit;

title "Key Variable Metadata Review";

proc print data=qc_key_metadata noobs;
run;

title;