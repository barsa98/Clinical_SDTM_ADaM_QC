*mock_submission_checklist.sas;


libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";



/*
PURPOSE:
Creates a final checklist for the mock clinical-trial
submission package.
*/

data mock_submission_checklist;

    length check $50
           status $10;

    check = "SDTM QC completed";
    status = "COMPLETE";
    output;

    check = "ADaM QC completed";
    status = "COMPLETE";
    output;

    check = "Independent QC completed";
    status = "COMPLETE";
    output;

    check = "PROC COMPARE completed";
    status = "COMPLETE";
    output;

    check = "SDTM XPT created";
    status = "COMPLETE";
    output;

    check = "ADaM XPT created";
    status = "COMPLETE";
    output;

    check = "Metadata QC completed";
    status = "COMPLETE";
    output;

    check = "Define-XML review completed";
    status = "COMPLETE";
    output;

    check = "Traceability documented";
    status = "COMPLETE";
    output;

    check = "Submission inventory created";
    status = "COMPLETE";
    output;

run;

title "Mock Submission Package Checklist";

proc print data=mock_submission_checklist noobs;
run;

title;