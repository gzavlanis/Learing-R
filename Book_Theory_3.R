data(iris)
library(hexbin)
library(scatterplot3d)
library(MASS)
library(outliers)

# Histograms
hist(iris$Petal.Length, breaks = c(1.0, 3.0, 4.5, 4.0, 6.9))

# Boxplots
boxplot(iris$Petal.Length)
boxplot(iris$Petal.Length, iris$Sepal.Width)
boxplot(iris)
boxplot(iris, notch = TRUE)

print(boxplot(iris$Sepal.Width))

# Scatter Plots
plot(iris$Petal.Width, iris$Petal.Length)
plot(iris)
plot(iris$Petal.Width, iris$Sepal.Length, pch = as.numeric(iris$Species))
plot(iris$Petal.Width, iris$Petal.Length)
identify(iris$Petal.Width, iris$Petal.Length)

plot(jitter(iris$Petal.Width), jitter(iris$Petal.Length))
plot(iris$Petal.Width, iris$Petal.Length, col = rgb(0, 0, 0, 50, maxColorValue = 255), pch = 16)

bin <- hexbin(iris$Petal.Width, iris$Petal.Length, xbins = 50)
plot(bin)

scatterplot3d(iris$Sepal.Length, iris$Sepal.Width, iris$Petal.Length)


# Principal Component Analysis
species <- which(colnames(iris) == "Species")
iris.pca <- prcomp(iris[,-species], center = T, scale = T)
print(iris.pca)
summary(iris.pca)
plot(predict(iris.pca))
# predict(iris.pca, newdata = x)

# Multidimensional Scaling
x <- iris[-102,]
species <- which(colnames(x) == "Species")
x.dist <- dist(x[,-species])
x.sammon <- sammon(x.dist, k = 2)
plot(x.sammon$points)

# Parallel Coordinates, Radar and Star Plots
x <- iris
x$Species <- as.numeric(iris$Species)
parcoord(x)
stars(iris)
stars(iris, locations = c(0, 0))

# Correlation Coefficients
cor(iris$Sepal.Length, iris$Sepal.Width)
cor.test(iris$Sepal.Length, iris$Sepal.Width, method = "spearman")
cor.test(iris$Sepal.Length, iris$Sepal.Width, method = "kendall")

# Grubb’s Test for Outlier Detection
grubbs.test(iris$Petal.Width)
