#-------------------------------------------------------------------------------
# HOSPITAL ADMISSIONS DATA ANALYSIS (R)
# Author      : Md Tariqul Islam (Tariq)
# Course      : Data Science (R Programming), Metro College
# Submitted to: Dr. Tareq Jaber
#
# DATASET
#   Hospital admissions test data from the "AV Healthcare Analytics II"
#   Kaggle competition dataset. 137,057 observations, 17 variables,
#   covering hospital region, admission type, department, ward type,
#   bed grade, severity of illness, age group, and admission deposit.
#
# OBJECTIVE
#   Explore hospital admissions data to identify patterns across
#   patient age groups, illness severity, admission type, department,
#   and financial (admission deposit) factors, and test whether bed
#   grade is correlated with admission deposit.
#
# ANALYSIS FLOW
#   1. Import data and explore structure (str, describe, complete.cases)
#   2. Univariate frequency analysis + bar plots for Age, Severity of
#      Illness, Type of Admission, and Department
#   3. Distribution analysis of Admission_Deposit (histogram, boxplot,
#      summary statistics: min/max/mean/sum)
#   4. Cross-tabulation of Type of Admission x Age, and Admission
#      Deposit x Age (xtabs)
#   5. Subsetting and filtering examples (by department, age group,
#      bed grade, deposit thresholds)
#   6. Aggregation by group (apply/tapply/by) - mean Admission_Deposit
#      by Age and by Bed Grade
#   7. Hypothesis test: Pearson correlation between Bed Grade and
#      Admission Deposit
#
# KEY RESULT
#   Total admission deposits across the dataset: ~$667.43 million.
#   Bed Grade and Admission Deposit are correlated (r = 0.067,
#   p < 2.2e-16) - statistically significant given the large sample,
#   but the correlation is very weak in practical terms.
#
# NOTE
#   This script reflects the original coursework submission, including
#   exploratory/console-history lines from early R learning (a few
#   lines do not run as-is - see README.md -> "Known Issues" for the
#   annotated list and suggested fixes). setwd() below points to a local
#   Windows path; update it to your own working directory before running.
#-------------------------------------------------------------------------------

#-----------------
getwd()
setwd('C:/Users/Tariq/OneDrive/Desktop/MTI/R-Health-Data')
getwd()


read.table("Health_test_data.csv",header=TRUE, sep=",", stringsAsFactors=FALSE)

hd=read.table("Health_test_data.csv",header=TRUE, sep=",", stringsAsFactors=FALSE)
hd

#Exploring Data
str(hd)

library(Hmisc)
describe(hd)

complete.cases(hd)

names(hd)
Age(hd)
hd$Hospital_code
hd$Age(namespaceImportClasses(21-30))
Age_range=table(hd$Age)
Age_range
max(Age_range)
max(which.max(Age_range))
which.max(Age_range)
which.min(Age_range)

plot(Age_range)
barplot(Age_range)
#-------------------------------------------------
severity_illness=table(hd$Severity.of.Illness)
severity_illness
which.max(severity_illness)

library(data.table)
t_data=transpose(hd$severity_illness)

t_data

plot(severity_illness)
barplot(severity_illness)
 #---------------------------------------------
Type_of_Admission=table(hd$Type.of.Admission)
Type_of_Admission
Type_of_Admission[3]
which.max(Type_of_Admission)
plot(Type_of_Admission)
which.max(Type_of_Admission)

barplot(Type_of_Admission[order(Type_of_Admission,decreasing=T)])
barplot(Type_of_Admission[order(Type_of_Admission,decreasing=T)])
#-----------------------------------------

Histogram=hist(hd$Admission_Deposit)
Histogram
which.max(hd$Admission_Deposit)
max(hd$Admission_Deposit)
min(hd$Admission_Deposit)
mean(hd$Admission_Deposit)
boxplot(hd$Admission_Deposit)
#-----------------------------------------

Department=table(hd$Department)
Department
max(Department)
which.max(Department)
barplot(Department)
barplot(Department[order(Department,decreasing=T)])
#---------------------------------------------

library(dplyr)
groupAge_range=group_by(0-10,11-20,20-Nov,21-30,31-40,41-50,51-60,61-70,71-80,81-90,91-100))

library(Hmisc)
describe(hd)
#------------------------------------------

#Total Admission Deposit
sum(hd$Admission_Deposit)

Emergency=subset(hd$Age)

dim(hd)

class(hd$Age)
class(hd$Admission_Deposit)
class(hd$Department)

mean(hd$Admission_Deposit)

levels(Age_range)
class(hd$Age)

table(hd$Department)
table(hd$Bed.Grade)
table(hd$Hospital_code)
table(hd$Ward_Type)
table(hd$Hospital_region_code)
table(hd$Available.Extra.Rooms.in.Hospital)
table(hd$Severity.of.Illness)
table(hd$Ward_Facility_Code)
table(hd$Type.of.Admission)
table(hd$Visitors.with.Patient)
table(hd$Age)
table(hd$Admission_Deposit)
z=xtabs(~Type.of.Admission+Age, data=hd)
z
barplot(z)

m=z=xtabs(~Admission_Deposit+Age, data=hd)
m



#------------------------------------------------------

hd[hd$Department.Group=="Gynecology",]


hd[hd$Age.Group=="21-30",]


hd[hd$Bed.Grade & hd$Admission_Deposit,]

hd[hd$Bed.Grade & hd$Admission_Deposit<2000,]

levels(hd$Age)


# Apply Function
dim(hd)

apply(hd$Admission_Deposit,sum)
attr(*,"dimnames")=List of 4
apply(hd,2,sum)


s=tapply(hd$Age,hd$Admission_Deposit,mean, na.rm=TRUE)
class(s)
s
q[1]


# by() function in R with mean

T=by(hd$Admission_Deposit,list(hd$Age),mean)
T
barplot(T)

grade=by(hd$Admission_Deposit,list(hd$Bed.Grade),mean)
grade
barplot(grade)


mtcars
with(mtcars, mpg[cyl == 8  &  disp > 350])


# is the same as, but nicer than
mtcars$mpg[mtcars$cyl == 8  &  mtcars$disp > 350]

hd
zz=with(hd,Department[Bed.Grade ==1 & Admission_Deposit>1800])

zz

str(zz)

dim(zz)
subset(hd,Admission_Deposit<2000, select=c(Department,Bed.Grade, Type.of.Admission,Age, nrows=10))
subset(hd, Type.of.Admission=="Emergency",select=c(Department,Bed.Grade, nrows=10))

subset(hd, Type.of.Admission=="Emergency",select=c(Department,Bed.Grade, nrows=10))


#Group by Function

hd1<-group_by(hd$Department)

hd_data=data.frame(hd)
hd_data
DA=subset(hd_data,Admission_Deposit<2000, select=c(Department, Age))
DA
dim(DA)
str(DA)
describe(DA)


#Corelation Test

cor.test(hd$Bed.Grade, hd$Admission_Deposit, conf.level = 0.90)

cor.test(hd$Bed.Grade, hd$Admission_Deposit, alternative = "greater")










