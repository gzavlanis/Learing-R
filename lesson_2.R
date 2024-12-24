# R Lesson 2

# Plot a 3d graph
library("plot3D")
library("Metrics")
library(caret)
library(MASS)
library(outliers)

x <- iris$Sepal.Length
y <- iris$Petal.Length
z <- iris$Sepal.Width
scatter3D(x, y, z, colvar = z)

# Principal component analysis using R
iris_stripped <- iris[,-5]
iris.pca <- prcomp(iris_stripped, center = TRUE, scale = TRUE)
plot(predict(iris.pca))
summary(iris.pca)

# Scree Plot using R
data("mtcars")

#Scale each of the variables to have a mean of 0 and a standard deviation of 1 excluding the categorical variables vs, am
mtcars <- subset(mtcars, select = -c(vs, am))
mtcars <- scale(mtcars)
mtcars <- as.data.frame(mtcars)

# Check the new variables that have been standardized
round(apply(mtcars, 2, mean, na.rm = TRUE), 4)
round(apply(mtcars, 2, sd, na.rm = TRUE), 4)

# calculate the covariance matrix A for the scaled variables
A <- cov(mtcars)
round(A, 4)

# Find all eigenvalues and the corresponding eigenvectors of the covariance matrix
ev <- eigen(A)
round(ev$values, 4)
round(ev$vectors, 4)

# Find the proportion of the variance explained (PVE)
PVE <- ev$values
sum(ev$values)
round(PVE, 4)

# Produce the scree plot (PVE plot)
plot(PVE, xlab = "Principal Component", ylab = "PVE", main = "Scree Plot", type = "o", pch = 19, ylim = c(0, 1))

# Mean Square Error using R
# Fit regression model
data(mtcars)
model <- lm(mpg~disp+hp, data = mtcars)

# Calculate MSE
mse(mtcars$mpg, predict(model, mtcars))

# Confusion matrix using R
# Creates vectors having data points
true_value <- factor(c(1, 0, 1, 0, 1, 1, 1, 0, 0, 1))
predicted_value <- factor(c(1, 0, 0, 1, 1, 1, 0, 0, 0, 1))

# Creating confusion matrix
example <- confusionMatrix(data = predicted_value , reference = true_value)

# Chi-square test of independence using R
tbl <- table(survey$Smoke, survey$Exer)
tbl

chisq1 <- chisq.test(survey$Smoke, survey$Exer, simulate.p.value = TRUE) # Pearson's Chi-squared test
ct_obs1 <- addmargins(chisq1$observed)
ct_obs1

ct_exp1 <- addmargins(round(chisq1$expected))
ct_exp1

# One-sample t-test using R Example 1
height <- c(160, 172, 168, 175, 165, 170, 162, 178, 169, 173, 167, 171, 164, 176, 163, 174, 166, 177, 168, 172, 169, 
          170, 165, 175, 167, 171, 164, 176, 163) # sample data
m0 <- 165 # Hypothesized population mean
t_test_result <- t.test(height, mu = m0) # Perform the one-sample t-test
print(t_test_result) # Print the results

# One-sample t-test using R Example 1
sample_data <- c(29, 31, 28, 30, 32, 27, 29, 31, 28, 30) # Sample data
t_test_result <- t.test(sample_data, mu = 30) # Perform one-sample t-test
print(t_test_result) # Print the result

# Chi-square exercise:
# Creation of the matrices:
data <- matrix(c(120, 90, 40, 110, 95, 45), ncol = 3, byrow = TRUE)
data <- matrix(c(120, 90, 40, 180, 55, 25), ncol = 3, byrow = TRUE)
rownames(data) <- c("Male", "Female")
colnames(data) <- c("Rep", "Dem", "Ind")

# Calculation of the p-value
a <- chisq.test(data)
a$p.value

# Creation of the stacked bar plot using data:
barplot(data, col = c("darkblue", "red"), legend = rownames(data))

# Statistical tests for outliers - Grubb's test
grubbs.test(iris$Sepal.Length)
grubbs.test(iris$Sepal.Width)
grubbs.test(iris$Petal.Length)
grubbs.test(iris$Petal.Width)

grubbs.test(iris$Sepal.Length, opposite = TRUE)
grubbs.test(iris$Sepal.Width, opposite = TRUE)
grubbs.test(iris$Petal.Length, opposite = TRUE)
grubbs.test(iris$Petal.Width, opposite = TRUE)
