# Question 1:
data_pca = prcomp(data, scale = TRUE)
data_var <- data_pca$sdev^2
pve = data_var / sum(data_var)
pve

