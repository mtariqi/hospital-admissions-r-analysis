# Project Brief

**Author:** Md Tariqul Islam (Tariq)
**Course:** Data Science (R Programming), Metro College
**Submitted to:** Dr. Tareq Jaber

## Dataset

**Hospital Admissions Data** — from the *AV Healthcare Analytics II*
Kaggle competition dataset.

- **137,057 observations**, **17 variables**
- Hospital-environment data covering: hospital region, admission type,
  admission deposit, age group, department, severity of illness, ward
  type, ward facility code, bed grade, visitors with patient, and more

## Objective

Critically evaluate hospital admissions data using R to identify
relationships between hospital/patient factors — hospital region,
admission type, department, ward type, bed grade, severity of illness,
age, and admission deposit — using descriptive statistics, cross-
tabulation, group aggregation, and hypothesis testing.

## Methodology

1. Import the dataset and explore its structure (`str`, `describe`,
   `complete.cases`)
2. Univariate frequency analysis and bar plots for Age, Severity of
   Illness, Type of Admission, and Department
3. Distribution analysis of Admission Deposit (histogram, boxplot,
   summary statistics)
4. Cross-tabulation of Type of Admission × Age, and Admission Deposit ×
   Age (`xtabs`)
5. Subsetting/filtering examples by department, age group, bed grade,
   and deposit thresholds
6. Group-level aggregation (`tapply`, `by`) — mean Admission Deposit by
   Age and by Bed Grade
7. Hypothesis test: Pearson correlation between Bed Grade and Admission
   Deposit

## Key Findings

- **Total admission deposits** across the dataset: **~$667.43 million**.
- Individuals in the **41–50 age group** received more attention/were
  more prevalent across various illness types in the dataset.
- Relative to other hospitals, more patients were admitted at hospitals
  in the **"X" region**.
- **Ward "R"** offers more facilities for Trauma patients compared to
  other wards.
- The hospital's **gynaecology department** was the busiest, treating
  more patients than other units.
- No significant difference was found in outcomes across **Bed Grade**
  categories on their own.
- Relative to other age groups, the **youngest and oldest patients**
  tended to put up higher admission deposits.
- **Correlation test (Bed Grade vs. Admission Deposit):** Pearson's r =
  0.0668, t = 24.778, df = 137,020, p < 2.2e-16 (90% CI: 0.062–0.071).
  Statistically significant given the very large sample size, but the
  correlation is **practically very weak**.

## Known Issues in the Original Script

The originally submitted `hospital_admissions_analysis.R` includes a
few lines that reflect exploratory console history from early R
learning and don't run as-is:

- `Age(hd)` and `hd$Age(namespaceImportClasses(21-30))` — not valid R
  syntax; appear to be exploratory attempts to subset/inspect the `Age`
  column.
- `t_data=transpose(hd$severity_illness)` — `severity_illness` is a
  local variable, not a column of `hd`; this line errors as written.
- `group_by(0-10,11-20,20-Nov,...)` — invalid arguments (this looks
  like pasted output from an `Age` factor's levels, not valid `dplyr`
  syntax).
- `apply(hd$Admission_Deposit,sum)` — missing the required `MARGIN`
  argument, and `attr(*,"dimnames")=List of 4` is pasted R console
  *output*, not runnable code.
- `q[1]` — references an undefined variable `q` (likely meant `s`, the
  result of the preceding `tapply()` call).
- The `mtcars` block is unrelated demo/tutorial code, not part of the
  hospital admissions analysis.

**[`scripts/hospital_admissions_analysis_cleaned.R`](../scripts/hospital_admissions_analysis_cleaned.R)**
preserves the original analysis logic and sequence while fixing these
issues so the script runs end-to-end — see that file for the working
version, and
**[`scripts/hospital_admissions_analysis.R`](../scripts/hospital_admissions_analysis.R)**
for the original as-submitted coursework version.

See [`../README.md`](../README.md) for the full repository overview.
