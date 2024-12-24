# Validation using R:
n <- length(iris$Species)
permut <- sample(c(1:n), n, replace = FALSE)
ord <- order(permut)
iris.shuffled <- iris[ord,]

prop.train <- 2/3
k <- round(prop.train*n)
iris.training <- iris.shuffled[1:k,]
iris.test <- iris.shuffled[(k + 1):n,]
