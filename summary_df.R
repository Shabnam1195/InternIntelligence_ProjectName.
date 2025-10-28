# generate summary statistics for  all numeric columns in the dataset
numeric_data=heart_disease[,sapply(heart_disease,is.numeric)]
summary_df=data.frame(t(sapply(numeric_data, summary)))
summary_df=round(summary_df, 2)
