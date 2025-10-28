#check columns
table(heart_disease$Gender)
table(heart_disease$`Exercise Habits`)
table(heart_disease$Smoking)
table(heart_disease$`Family Heart Disease`)
table(heart_disease$Diabetes)
table(heart_disease$`High Blood Pressure`)
table(heart_disease$`Low HDL Cholesterol`)
table(heart_disease$`High LDL Cholesterol`)
table(heart_disease$`Alcohol Consumption`)
table(heart_disease$`Stress Level`)
table(heart_disease$`Sugar Consumption`)
table(heart_disease$`Heart Disease Status`)
#check missing value
library(DataExplorer)
plot_missing(heart_disease)
# sum missing values with precent
sum_precent=mean(is.na(heart_disease))*100
#Missing values are minimal, removing all NA is appropriate
heart_disease=na.omit(heart_disease)
#chech duplicates
dup_count=sum(duplicated(heart_disease)
#check types
vapply(heart_disease,is.numeric,logical(1))
