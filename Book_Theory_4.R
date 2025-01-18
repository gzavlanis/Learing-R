# Validation using R:
n <- length(iris$Species)
permut <- sample(c(1:n), n, replace = FALSE)
ord <- order(permut)
iris.shuffled <- iris[ord,]

prop.train <- 2/3
k <- round(prop.train*n)
iris.training <- iris.shuffled[1:k,]
iris.test <- iris.shuffled[(k + 1):n,]

# Data preparation using R:
# Missing values:
x <- c(3, 2, NA, 4, NA, 1, NA, NA, 5)
mean(x)
mean(x, na.rm = T)

# Normalization and Scaling:

iris.norm <- iris

for (i in c(1:length(iris.norm))) {
  if (!is.factor(iris.norm[,i])) {
    attr.mean <- mean(iris.norm[,i])
    attr.sd <- sd(iris.norm[,i])
    iris.norm[,i] <- (iris.norm[,i] - attr.mean) / attr.sd
  }
}

