# group by heart diseases status and gender
library(dplyr)
library(tidyr)
gender_group= heart_disease %>% group_by(`Heart Disease Status`,Gender) %>%
  summarise(count=n(), .groups = "drop") %>%
  pivot_wider(
    names_from = `Heart Disease Status`,
    values_from = count
  )
# gender distribution for heart disease positive cases
gender_dist=data.frame(table(dataset$Gender))

# gender distribution plot for positive cases
library(ggplot2)
ggplot(dataset, aes(x=Gender,fill = `Heart Disease Status`))+
  geom_bar(position = "dodge")
