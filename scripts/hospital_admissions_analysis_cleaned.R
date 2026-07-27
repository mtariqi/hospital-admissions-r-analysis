#-------------------------------------------------------------------------------
# HOSPITAL ADMISSIONS DATA ANALYSIS (R) — CLEANED / RUNNABLE VERSION
# Author      : Md Tariqul Islam (Tariq)
# Course      : Data Science (R Programming), Metro College
# Submitted to: Dr. Tareq Jaber
#
# This is a cleaned, runnable version of hospital_admissions_analysis.R.
# It preserves the original analysis steps and logic but fixes the lines
# that didn't execute as originally written (see README.md -> "Known
# Issues" for what changed and why). Use this version to actually run
# the analysis; see the original script for the as-submitted coursework
# version.
#-------------------------------------------------------------------------------

## 0. Setup ---------------------------------------------------------------
# Update this path to your own working directory
# setwd("path/to/hospital-admissions-r-analysis/data")

library(Hmisc)
library(dplyr)

## 1. Import & explore ------------------------------------------------------
hd <- read.table("Health_test_data.csv", header = TRUE, sep = ",",
                  stringsAsFactors = FALSE)

str(hd)
describe(hd)
sum(complete.cases(hd))   # count of fully complete rows
names(hd)
dim(hd)

## 2. Univariate analysis: Age --------------------------------------------
Age_range <- table(hd$Age)
Age_range
which.max(Age_range)   # most common age group
which.min(Age_range)   # least common age group

barplot(Age_range, main = "Patient Count by Age Group",
        xlab = "Age Group", ylab = "Count", col = "steelblue")

## 3. Univariate analysis: Severity of Illness -----------------------------
severity_illness <- table(hd$Severity.of.Illness)
severity_illness
which.max(severity_illness)

barplot(severity_illness, main = "Patient Count by Severity of Illness",
        xlab = "Severity", ylab = "Count", col = "darkorange")

## 4. Univariate analysis: Type of Admission -------------------------------
Type_of_Admission <- table(hd$Type.of.Admission)
Type_of_Admission
which.max(Type_of_Admission)

barplot(Type_of_Admission[order(Type_of_Admission, decreasing = TRUE)],
        main = "Patient Count by Type of Admission",
        xlab = "Admission Type", ylab = "Count", col = "seagreen")

## 5. Admission Deposit: distribution & summary stats ----------------------
hist(hd$Admission_Deposit, main = "Distribution of Admission Deposit",
     xlab = "Admission Deposit", col = "lightblue")
boxplot(hd$Admission_Deposit, main = "Admission Deposit — Boxplot",
        ylab = "Admission Deposit")

max(hd$Admission_Deposit)
min(hd$Admission_Deposit)
mean(hd$Admission_Deposit)
sum(hd$Admission_Deposit)     # total admission deposit across all patients

## 6. Univariate analysis: Department --------------------------------------
Department <- table(hd$Department)
Department
which.max(Department)

barplot(Department[order(Department, decreasing = TRUE)],
        main = "Patient Count by Department",
        xlab = "Department", ylab = "Count", col = "plum")

## 7. Frequency tables for remaining categorical variables -----------------
table(hd$Bed.Grade)
table(hd$Hospital_code)
table(hd$Ward_Type)
table(hd$Hospital_region_code)
table(hd$Available.Extra.Rooms.in.Hospital)
table(hd$Ward_Facility_Code)
table(hd$Visitors.with.Patient)

## 8. Cross-tabulations -----------------------------------------------------
z <- xtabs(~ Type.of.Admission + Age, data = hd)
z
barplot(z, beside = TRUE, legend.text = TRUE,
        main = "Type of Admission by Age Group")

## 9. Subsetting / filtering examples ---------------------------------------
hd[hd$Department == "gynecology", ][1:5, ]                 # by department
hd[hd$Age == "21-30", ][1:5, ]                              # by age group
hd[hd$Bed.Grade == 1 & hd$Admission_Deposit < 2000, ][1:5, ]  # by bed grade + deposit

subset(hd, Admission_Deposit < 2000,
       select = c(Department, Bed.Grade, Type.of.Admission, Age))[1:10, ]
subset(hd, Type.of.Admission == "Emergency",
       select = c(Department, Bed.Grade))[1:10, ]

## 10. Group-level aggregation ----------------------------------------------
# Mean Admission Deposit by Age group
mean_deposit_by_age <- tapply(hd$Admission_Deposit, hd$Age, mean, na.rm = TRUE)
mean_deposit_by_age
barplot(mean_deposit_by_age, main = "Mean Admission Deposit by Age Group",
        xlab = "Age Group", ylab = "Mean Deposit", col = "coral")

# Mean Admission Deposit by Bed Grade
mean_deposit_by_grade <- by(hd$Admission_Deposit, list(hd$Bed.Grade), mean)
mean_deposit_by_grade
barplot(as.numeric(mean_deposit_by_grade),
        names.arg = names(table(hd$Bed.Grade)),
        main = "Mean Admission Deposit by Bed Grade",
        xlab = "Bed Grade", ylab = "Mean Deposit", col = "gold")

## 11. Hypothesis test: Bed Grade vs. Admission Deposit ---------------------
# H0: Bed Grade and Admission Deposit are not correlated
# HA: Bed Grade and Admission Deposit are correlated
# Reject H0 if p <= 0.05

cor.test(hd$Bed.Grade, hd$Admission_Deposit, conf.level = 0.90)
cor.test(hd$Bed.Grade, hd$Admission_Deposit, alternative = "greater")

# Result: r = 0.067, p < 2.2e-16 -> statistically significant given the
# large sample size, but a very weak correlation in practical terms.
