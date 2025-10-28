#starting data analysis
# firs age summary
# filtr only yes value of heart deases status
dataset=subset(heart_disease,heart_disease$`Heart Disease Status`=="Yes")
age_summary= data.frame (
  Min_age=min(dataset$Age),
  Max_age=max(dataset$Age),
  Mean_age=mean(dataset$Age),
  Median_age=median(dataset$Age),
  SD_age=sd(dataset$Age)  )

# creating age catagories for heart diseases status
age_arrange=data.frame(table(dataset$Age))
age_arrange$Var1=as.numeric(age_arrange$Var1)
library(dplyr)
age_arrange$age_catagories=cut(age_arrange$Var1,breaks = c(0,20,40,60,80,100),
                               labels = c("1-20","20-40","40-60","60-80","80-100"),
                               right = FALSE)
age_arrange=age_arrange %>% group_by(age_catagories) %>% 
           summarise(sum_deases=sum(Freq))


