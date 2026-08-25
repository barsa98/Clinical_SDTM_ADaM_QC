# Clinical_SDTM_ADaM_QC
Independent SDTM and ADaM QC, validation, traceability, metadata review, and submission-readiness assessment using SAS and SQL.

# Clinical SAS SDTM/ADaM QC & Mock Submission Pipeline

## Overview

This project demonstrates an end-to-end **Clinical SAS data validation, independent QC, traceability, and mock submission workflow** using publicly available clinical trial datasets from the `clinical_fd` (Clinical Fake Data) project.

The original `clinical_fd` project provides fake SDTM and ADaM datasets intended for generating Tables, Figures, and Listings (TFLs) using R.

In this project, the same clinical datasets are used as the input for an independent **SAS-based QC and validation pipeline**.

The goal is not to reproduce the original R-based TFL generation. Instead, the project demonstrates how a Clinical SAS Programmer can independently review, validate, compare, and document SDTM and ADaM datasets before a simulated submission.

---

## Source Data

The datasets used in this project come from:

**sas2r/clinical_fd – Clinical Fake Data**

https://github.com/sas2r/clinical_fd

The `clinical_fd` package provides simulated SDTM and ADaM clinical trial datasets for public use.

The original project describes data from **CDISCPilot01**, including:

### Efficacy

- ADAS-Cog (11) at Week 24 – primary endpoint
- CIBIC+ at Week 24 – primary endpoint
- NPI-X – secondary endpoint

### Safety

Safety-related data include:

- Adverse Events
- Clinical Chemistry Laboratory Results
- Hematology
- Hy's Rule
- Vital Signs
- Time to first dermatologic adverse event

This project does not perform the original efficacy/safety TFL analyses. It uses the datasets specifically for SAS QC and validation practice.

---

# Project Objective

The objective of this project is to demonstrate an end-to-end Clinical SAS data QC and submission-readiness workflow using publicly available simulated clinical-trial SDTM and ADaM datasets.

The project focuses on validating data quality, checking relationships between SDTM and ADaM, independently reproducing analysis datasets, comparing results, validating submission formats and metadata, and documenting traceability through a simulated submission process.

The workflow covers:

SDTM Data QC – structural, completeness, uniqueness, duplicate, date, and referential-integrity checks.
ADaM Data QC – subject-level, treatment, analysis-variable, and source-data consistency checks.
SDTM-to-ADaM Traceability – documenting how analysis records and variables can be traced back to their SDTM sources.
Independent QC Programming – independently deriving QC datasets from SDTM source data.
Dataset Comparison – using PROC COMPARE to identify differences between provided ADaM datasets and independently derived QC datasets.
XPT Creation & Validation – preparing selected SDTM and ADaM datasets in SAS Transport format and performing structural checks.
Metadata QC – reviewing variable names, labels, types, lengths, formats, and other dataset attributes.
Define-XML Review – creating a basic review of dataset and variable metadata relevant to Define-XML.
Final Traceability Assessment – summarizing record-level relationships and matched/unmatched records.
Mock Submission Package – creating a final dataset inventory, validation summary, and submission-readiness checklist.

---

# Workflow

                    Clinical Fake Data
                           |
                           v
                 SDTM / ADaM Datasets
                           |
                           v
                  SAS Library Setup
                           |
                           v
                     SDTM QC
              ┌────────────┴────────────┐
              |                         |
       Structure & Quality       Referential Integrity
              |                         |
              └────────────┬────────────┘
                           v
                     ADaM QC
              ┌────────────┴────────────┐
              |                         |
       Dataset Validation       Source Data Checks
              |                         |
              └────────────┬────────────┘
                           v
                  SDTM → ADaM
                   Traceability
                           |
                           v
                  Independent QC
                           |
                           v
                    PROC COMPARE
                           |
                           v
                 XPT Creation &
                    Validation
                           |
                           v
                   Metadata QC
                           |
                           v
                 Define-XML Review
                           |
                           v
              Final Traceability
                  Assessment
                           |
                           v
             Mock Submission Package
