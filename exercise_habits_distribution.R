#exercise_habits for positive cases 
exercise_habits_distrubition=data.frame(table(dataset$`Exercise Habits`))
#group by heart disease status and exercise habits
library(dplyr)
library(tidyr)
exercise_habits_group= heart_disease %>% group_by(`Heart Disease Status`,`Exercise Habits`) %>%
  summarise(count=n(), .groups = "drop") %>% 
  pivot_wider( 
   names_from = `Heart Disease Status`,
   values_from = count
     )
  