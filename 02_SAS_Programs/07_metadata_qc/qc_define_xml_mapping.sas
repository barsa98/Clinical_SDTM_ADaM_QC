*qc_define_xml_mapping.sas;


libname adam "/home/u64542693/ADAM_QC";
libname adam "/home/u64542693/SDTM_QC";


/*
PURPOSE:
Creates a basic dataset-to-metadata mapping table for
Define-XML review.

This does not generate Define-XML.
It provides a QC checklist showing which datasets and
variables should be represented in Define-XML.
*/

proc sql;

    create table define_xml_review as

    select "SDTM" as domain_type length=10,
           "DM" as dataset length=20,
           name as variable length=40,
           label,
           type,
           length
    from metadata_dm

    union all

    select "SDTM",
           "AE",
           name,
           label,
           type,
           length
    from metadata_ae

    union all

    select "SDTM",
           "LBCH",
           name,
           label,
           type,
           length
    from metadata_lbch

    union all

    select "ADAM",
           "ADSL",
           name,
           label,
           type,
           length
    from metadata_adsl

    union all

    select "ADAM",
           "ADAE",
           name,
           label,
           type,
           length
    from metadata_adae

    union all

    select "ADAM",
           "ADLBC",
           name,
           label,
           type,
           length
    from metadata_adlbc;

quit;

title "Define-XML Dataset and Variable Review";

proc print data=define_xml_review noobs;
run;

title;