library(dplyr)
library(ggplot2)
library(caret)
library(corrplot)
df <- read.csv("heart_disease.csv")
Heart.Disease.Status <- as.factor(df$Heart.Disease.Status)
# Histogram - Age
ggplot(df, aes(x = Age)) + geom_histogram(binwidth = 5, fill="skyblue", color="black")

# Boxplot - BMI
ggplot(df, aes(y = BMI)) + geom_boxplot(fill="tomato")

# Gender üzrə xəstəlik yayılması
ggplot(df, aes(x = Gender, fill = Heart.Disease.Status)) +
  geom_bar(position = "dodge")
df$Heart.Disease.Status <- as.factor(df$Heart.Disease.Status)
# Korrelyasiya matrisi
num_cols <- sapply(df, is.numeric)
corr_matrix <- cor(df[, num_cols], use = "complete.obs")
corrplot(corr_matrix, method="color")
df$Heart.Disease.Status <- ifelse(df$Heart.Disease.Status == "Yes", 1, 0)
df$Heart.Disease.Status <- as.factor(df$Heart.Disease.Status)
# Train/Test bölünməsi
set.seed(42)
index <- createDataPartition(df$Heart.Disease.Status, p=0.8, list=FALSE)
train_data <- df[index, ]
test_data <- df[-index, ]

# Logistic Regression
model <- glm(Heart.Disease.Status ~ ., 
             data = train_data, 
             family = binomial)

pred_prob <- predict(model, test_data, type = "response")
pred_class <- ifelse(pred_prob > 0.5, 1, 0)

library(caret)
confusionMatrix(factor(pred_class), test_data$Heart.Disease.Status)


confusionMatrix(pred_class, test_data$Heart.Disease.Status)
