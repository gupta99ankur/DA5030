df <- read.csv("dataset-uci.csv", stringsAsFactors = F, header = T)
head(df, 5)

nrow(df)
ncol(df)

str(df$Gallstone.Status)
table(df$Gallstone.Status) 

sapply(df, class)

predictors <- df[, setdiff(names(df), "Gallstone.Status")]
numeric_vars <- names(predictors)[sapply(predictors, is.numeric)]

par(mfrow=c(5, 5))  # Adjust depending on number of plots
for (col in numeric_vars) {
  hist(df[[col]], main = col, xlab = "", col = "lightblue")
}


# Calculate correlation matrix for numeric features only
numeric_predictors <- df[, sapply(df, is.numeric)]
numeric_predictors <- numeric_predictors[, setdiff(names(numeric_predictors), "Gallstone.Status")]

cor_matrix <- cor(numeric_predictors)

# Find high correlations
high_cor_pairs <- which(abs(cor_matrix) > 0.8 & abs(cor_matrix) < 1, arr.ind = TRUE)
cor_matrix[high_cor_pairs]

ncol(df)