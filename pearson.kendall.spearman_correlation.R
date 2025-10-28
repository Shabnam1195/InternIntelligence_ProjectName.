# Correlation with Heart disease status
# pearson,superman,kendal methods
# convert Heart disease Status to numeric(0,1)
heart_disease$HDS_binary=ifelse(heart_disease$`Heart Disease Status`=="Yes",1,0)
# Select numeric columns
num_cols=sapply(heart_disease,is.numeric)
# 1. Pearson (liner) correlation with heart disease status
pearson_cor=sapply(heart_disease[, num_cols],function(x) cor(heart_disease$HDS_binary,x,method = "pearson"))
# 2.Spearman correlation with heart disease status
supearman_cor=sapply(heart_disease[, num_cols],function(x) cor(heart_disease$HDS_binary,x,method = "spearman"))
# 3.Kendall correlation with heart disease status
kendall_cor=sapply(heart_disease[, num_cols],function(x) cor(heart_disease$HDS_binary,x,method = "kendall"))
# combine all into o single data frame
cor_data= data.frame(
  Variable=names(pearson_cor),
  PearsonCorrelation=pearson_cor,
  SupermanCorrelation=supearman_cor,
  KendallCorrelation=kendall_cor,
  row.names = NULL
  
)
# Remove self-correlation
cor_data=cor_data[cor_data$Variable!="HDB_binary",]
# Sort by in descending order
cor_data=cor_data[order(-abs(cor_data$PearsonCorrelation)),]

