# Smoking distribution with plot
library(ggplot2)
ggplot(heart_disease,aes(x=Smoking)) +
  geom_bar(fill="tomato") +
  labs(title = "Smoking Distribution",
       x= "Smoking Status",
       y= "Number of patients")
# Heart disase by smoking 
ggplot(heart_disease,aes(x=Smoking,fill = `Heart Disease Status`)) +
  geom_bar(position = "dodge") +
  labs(title = "Heart Disase by Smoking",
       x="Smoking Status",
       y="Number of patients")
