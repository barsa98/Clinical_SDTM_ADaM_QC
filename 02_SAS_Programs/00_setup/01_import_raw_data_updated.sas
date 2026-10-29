
/* 01_import_raw_data.sas */

/*
PURPOSE:
Imports raw SDTM and ADaM CSV datasets into SAS libraries.

WORKFLOW:
1. Assign SAS libraries.
2. Import datasets using a reusable macro.
3. Inspect dataset structures using a reusable macro.
4. Generate dataset inventories.

DATASETS:
SDTM: DM, AE, LBCH
ADaM: ADSL, ADAE, ADLBC
*/


/*--------------------------------------------------*/
/* 1. Assign libraries                              */
/*--------------------------------------------------*/

libname qc   "/home/u64542693/QC_codes/00_setup";
libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";


/*--------------------------------------------------*/
/* 2. Import datasets using a reusable macro        */
/*--------------------------------------------------*/

%macro import_csv(lib=, folder=, datasets=);

    %local i dataset;

    %do i = 1 %to %sysfunc(countw(&datasets));

        %let dataset = %scan(&datasets, &i);

        %put NOTE: Importing &dataset into &lib..&dataset..;

        proc import
            datafile="/home/u64542693/&folder./&dataset..csv"
            out=&lib..&dataset
            dbms=csv
            replace;
            guessingrows=max;
            getnames=yes;
        run;

    %end;

%mend import_csv;


/* Import all SDTM datasets */
%import_csv(
    lib=sdtm,
    folder=SDTM_QC,
    datasets=dm ae lbch
);

/* Import all ADaM datasets */
%import_csv(
    lib=adam,
    folder=ADAM_QC,
    datasets=adsl adae adlbc
);


/*--------------------------------------------------*/
/* 3. Inspect dataset structures using a macro      */
/*--------------------------------------------------*/

%macro inspect_library(lib=, title_text=);

    title "&title_text";

    proc contents data=&lib.._all_ nods;
    run;

%mend inspect_library;


%inspect_library(
    lib=sdtm,
    title_text=SDTM Dataset Contents
);

%inspect_library(
    lib=adam,
    title_text=ADaM Dataset Contents
);


/*--------------------------------------------------*/
/* 4. Generate dataset inventories using a macro    */
/*--------------------------------------------------*/

%macro dataset_inventory(lib=, datasets=, title_text=);

    title "&title_text";

    proc sql;
        select memname as Dataset,
               nobs as Observations,
               nvar as Variables
        from dictionary.tables
        where libname = "%upcase(&lib)"
          and memtype = "DATA"
          and memname in (
              %local i dataset;
              %do i = 1 %to %sysfunc(countw(&datasets));
                  %let dataset = %upcase(%scan(&datasets, &i));
                  %if &i > 1 %then ,;
                  "&dataset"
              %end;
          )
        order by memname;
    quit;

%mend dataset_inventory;


/* SDTM inventory */
%dataset_inventory(
    lib=sdtm,
    datasets=dm ae lbch,
    title_text=SDTM Dataset Inventory
);

/* ADaM inventory */
%dataset_inventory(
    lib=adam,
    datasets=adsl adae adlbc,
    title_text=ADaM Dataset Inventory
);

title;
