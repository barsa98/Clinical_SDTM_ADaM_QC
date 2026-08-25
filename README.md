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

The objective is to demonstrate a realistic Clinical SAS workflow covering:

1. SDTM data QC
2. ADaM data QC
3. SDTM-to-ADaM traceability
4. Independent QC programming
5. Dataset comparison using `PROC COMPARE`
6. SAS Transport File (XPT) creation and validation
7. Metadata validation
8. Define-XML review
9. Final traceability documentation
10. Mock submission package checks

---

# Workflow

```text
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
       |
       v
ADaM QC
       |
       v
Traceability
       |
       v
Independent QC
       |
       v
PROC COMPARE
       |
       v
XPT Creation & Validation
       |
       v
Metadata QC
       |
       v
Define-XML Review
       |
       v
Final Traceability
       |
       v
Mock Submission Package
