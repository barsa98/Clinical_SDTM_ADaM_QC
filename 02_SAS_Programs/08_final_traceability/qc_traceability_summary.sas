*qc_traceability_summary.sas;

libname sdtm "/home/u64542693/SDTM_QC";
libname adam "/home/u64542693/ADAM_QC";



/*
PURPOSE:
Summarizes the final traceability checks performed between
ADaM and SDTM datasets.
*/

proc sql;

    create table qc_traceability_summary as

    select "ADSL -> DM" as traceability length=30,
           count(*) as total_records,
           sum(case when d.usubjid is not null then 1 else 0 end) as matched_records,
           sum(case when d.usubjid is null then 1 else 0 end) as unmatched_records
    from adam.adsl as a
    left join sdtm.dm as d
        on a.usubjid = d.usubjid

    union all

    select "ADAE -> AE",
           count(*),
           sum(case when e.usubjid is not null then 1 else 0 end),
           sum(case when e.usubjid is null then 1 else 0 end)
    from adam.adae as a
    left join sdtm.ae as e
        on a.usubjid = e.usubjid
       and a.aeseq = e.aeseq

    union all

    select "ADLBC -> LBCH",
           count(*),
           sum(case when l.usubjid is not null then 1 else 0 end),
           sum(case when l.usubjid is null then 1 else 0 end)
    from adam.adlbc as a
    left join sdtm.lbch as l
        on a.usubjid = l.usubjid;

quit;

title "Final Traceability Summary";

proc print data=qc_traceability_summary noobs;
run;

title;