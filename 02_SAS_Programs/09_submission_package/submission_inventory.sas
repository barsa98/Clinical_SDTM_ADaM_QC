*submission_inventory.sas;

options dlcreatedir;


libname ftrace "/home/u64542693/QC_codes/09_submission_package";


libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";



/*
PURPOSE:
Creates an inventory of datasets intended for the
mock clinical-trial submission package.
*/

data submission_inventory;

    length dataset_type $10
           dataset_name $10
           source_library $10
           submission_format $10;

    dataset_type = "SDTM";
    dataset_name = "DM";
    source_library = "SDTM";
    submission_format = "XPT";
    output;

    dataset_name = "AE";
    output;

    dataset_name = "LBCH";
    output;

    dataset_type = "ADaM";
    dataset_name = "ADSL";
    source_library = "ADAM";
    submission_format = "XPT";
    output;

    dataset_name = "ADAE";
    output;

    dataset_name = "ADLBC";
    output;

run;

title "Mock Submission Dataset Inventory";

proc print data=submission_inventory noobs;
run;

title;