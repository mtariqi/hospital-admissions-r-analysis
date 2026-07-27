<p align="center">
  <img src="assets/banner.png" alt="Hospital Admissions Data Analysis banner" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/R-Base%20%2F%20Hmisc%20%2F%20dplyr-276DC3?style=flat-square&logo=r&logoColor=white" alt="R">
  <img src="https://img.shields.io/badge/Analysis-Exploratory%20%2B%20Correlation-2D6E7E?style=flat-square" alt="Analysis type">
  <img src="https://img.shields.io/badge/Sample-137%2C057%20observations-4C8C4A?style=flat-square" alt="Sample size">
  <img src="https://img.shields.io/badge/Total%20Deposits-%24667.43M-C0392B?style=flat-square" alt="Total deposits">
  <img src="https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square" alt="License: MIT">
  <img src="https://img.shields.io/badge/Status-Complete-brightgreen?style=flat-square" alt="Status">
</p>

# 🏥 Hospital Admissions Data Analysis (R)

An R-based exploratory data analysis of hospital admissions data,
examining patterns across patient age, illness severity, admission
type, department, ward, bed grade, and admission deposit — including
cross-tabulation, group-level aggregation, and a correlation hypothesis
test between bed grade and admission deposit.

**Author:** Md Tariqul Islam (Tariq) · Metro College, Data Science (R Programming)
**Submitted to:** Dr. Tareq Jaber

---

## 📋 Table of Contents

- [Overview](#overview)
- [Dataset](#dataset)
- [Methodology](#methodology)
- [Key Findings](#key-findings)
- [Repository Structure](#repository-structure)
- [Reproducing the Analysis](#reproducing-the-analysis)
- [Known Issues](#known-issues)
- [Tech Stack](#tech-stack)

---

## Overview

This project explores hospital admissions data to surface patterns
across patient demographics and hospital operations: which age groups
receive the most attention, which regions and wards see the most
admissions, how departments compare in patient volume, and whether bed
grade relates meaningfully to the amount patients pay as an admission
deposit.

📄 Full write-up of methodology, findings, and script notes:
[`docs/project_brief.md`](docs/project_brief.md)
📄 Original submitted report: [`docs/report/Project_Report.pdf`](docs/report/Project_Report.pdf)

## Dataset

**Hospital Admissions Data** — from the *AV Healthcare Analytics II*
Kaggle competition dataset ([`data/Health_test_data.csv`](data/Health_test_data.csv)).

- **137,057 observations**, **17 variables**
- Includes: hospital code/type/region, city code, available extra rooms,
  department, ward type & facility code, bed grade, patient ID, city
  code (patient), type of admission, severity of illness, visitors with
  patient, age group, and admission deposit

## Methodology

1. **Import & explore** — load the CSV, inspect structure (`str`,
   `describe`, `complete.cases`)
2. **Univariate analysis** — frequency tables and bar plots for Age,
   Severity of Illness, Type of Admission, and Department
3. **Admission Deposit distribution** — histogram, boxplot, and summary
   statistics (min, max, mean, sum)
4. **Cross-tabulation** — Type of Admission × Age, and Admission
   Deposit × Age (`xtabs`)
5. **Subsetting & filtering** — examples by department, age group, bed
   grade, and deposit thresholds
6. **Group-level aggregation** — mean Admission Deposit by Age and by
   Bed Grade (`tapply`, `by`)
7. **Hypothesis testing** — Pearson correlation between Bed Grade and
   Admission Deposit (H0: no correlation; reject if p ≤ 0.05)

## Key Findings

- **Total admission deposits** across the dataset: **~$667.43 million**.
- Patients in the **41–50 age group** appear most often across various
  illness types in the dataset.
- Hospitals in the **"X" region** admitted more patients relative to
  other regions.
- **Ward "R"** offers more facilities for Trauma patients than other
  wards.
- The **gynaecology department** was the busiest, treating more
  patients than other departments.
- No standout difference was found across **Bed Grade** categories on
  their own.
- The **youngest and oldest** patients tended to put up higher
  admission deposits relative to other age groups.
- **Bed Grade vs. Admission Deposit correlation:** r = 0.0668,
  p < 2.2e-16 (90% CI: 0.062–0.071) — statistically significant given
  the large sample, but a practically very weak relationship.

## Repository Structure

```
hospital-admissions-r-analysis/
├── README.md                          <- you are here
├── LICENSE
├── data/
│   └── Health_test_data.csv           <- source dataset (Kaggle)
├── scripts/
│   ├── hospital_admissions_analysis.R          <- original as-submitted script
│   └── hospital_admissions_analysis_cleaned.R  <- cleaned, runnable version
├── docs/
│   ├── project_brief.md               <- methodology, findings & script notes
│   ├── report/
│   │   └── Project_Report.pdf         <- original submitted report
│   └── presentation/
│       └── Hospital_Admissions_Presentation.pptx
└── output/
    └── figures/                       <- chart screenshots from the presentation
        ├── 00_total_admission_deposit_summary.png
        ├── 01_age_distribution.jpg
        ├── 02_severity_of_illness_distribution.jpg
        ├── 03_type_of_admission_distribution.jpg
        ├── 04_admission_deposit_histogram.jpg
        ├── 05_admission_deposit_boxplot.jpg
        ├── 06_department_distribution.jpg
        ├── 07_admission_type_by_age_crosstab.jpg
        ├── 08_mean_deposit_by_age.jpg
        └── 09_mean_deposit_by_bed_grade.jpg
```

## Reproducing the Analysis

1. Clone this repo (or download it) so `data/Health_test_data.csv` sits
   alongside the scripts.
2. Install required R packages if you don't already have them:
   ```r
   install.packages(c("Hmisc", "dplyr", "data.table"))
   ```
3. Open [`scripts/hospital_admissions_analysis_cleaned.R`](scripts/hospital_admissions_analysis_cleaned.R)
   in RStudio (or your R environment of choice).
4. Set your working directory to the `data/` folder (or update the file
   path in the `read.table()` call), then run the script top to bottom.
5. The original as-submitted script is preserved at
   [`scripts/hospital_admissions_analysis.R`](scripts/hospital_admissions_analysis.R)
   for reference — see [Known Issues](#known-issues) below before
   trying to run it directly.

## Known Issues

The original submitted script includes a handful of lines that reflect
exploratory console history from early R learning and don't execute as
written (invalid function calls, a stray pasted console-output line,
an undefined variable reference, and an unrelated `mtcars` demo
snippet). These are documented in detail, with the reasoning behind
each fix, in [`docs/project_brief.md`](docs/project_brief.md#known-issues-in-the-original-script).
The cleaned script addresses all of them while preserving the original
analysis logic and order.

## Tech Stack

- **R** — base R (`table`, `tapply`, `by`, `xtabs`, `subset`, `cor.test`,
  `hist`, `boxplot`, `barplot`), **Hmisc** (`describe`), **dplyr**,
  **data.table**

---

*This repository documents a coursework analytics project. Statistical
results reflect the dataset used for the assignment and are for
educational purposes. The source dataset is from the Kaggle "AV
Healthcare Analytics II" competition — see Kaggle's terms for
redistribution/usage guidance if reusing this data elsewhere.*
