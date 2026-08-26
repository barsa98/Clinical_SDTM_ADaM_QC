*qc_metadata_completeness.sas;

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";

/*
PURPOSE:
Checks whether important metadata attributes are populated.

QC CHECK:
Identifies variables with missing labels or invalid/missing
variable names.

This provides a basic metadata completeness check before
Define-XML review.
*/

proc sql;

    create table qc_dm_metadata as
    select *
    from metadata_dm
    where missing(name)
       or missing(label);

    create table qc_ae_metadata as
    select *
    from metadata_ae
    where missing(name)
       or missing(label);

    create table qc_lbch_metadata as
    select *
    from metadata_lbch
    where missing(name)
       or missing(label);

    create table qc_adsl_metadata as
    select *
    from metadata_adsl
    where missing(name)
       or missing(label);

    create table qc_adae_metadata as
    select *
    from metadata_adae
    where missing(name)
       or missing(label);

    create table qc_adlbc_metadata as
    select *
    from metadata_adlbc
    where missing(name)
       or missing(label);

quit;

title "DM Metadata Completeness";
proc print data=qc_dm_metadata noobs;
run;

title "AE Metadata Completeness";
proc print data=qc_ae_metadata noobs;
run;

title "LBCH Metadata Completeness";
proc print data=qc_lbch_metadata noobs;
run;

title "ADSL Metadata Completeness";
proc print data=qc_adsl_metadata noobs;
run;

title "ADAE Metadata Completeness";
proc print data=qc_adae_metadata noobs;
run;

title "ADLBC Metadata Completeness";
proc print data=qc_adlbc_metadata noobs;
run;

title;