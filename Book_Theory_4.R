library(plyr)
library(ggplot2)
library(cluster)
library(lattice)
library(graphics)
library(grid)
library(gridExtra)

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

# Using R to perform a K-means Analysis

grade_input = as.data.frame(read.csv("./Data/grades_km_input.csv")) # import the students grades
kmdata_orig = as.matrix(grade_input[,c("Student", "English", "Math", "Science")])
kmdata <- kmdata_orig[,2:4]
kmdata[1:10,]

wss <- numeric(15)
for (k in 1:15) wss[k] <- sum(kmeans(kmdata, centers = k, nstart = 25)$withinss)
plot(1:15, wss, type = "b", xlab = "Number of clusters", ylab = "Within Sum of Squares")

km = kmeans(kmdata, 3, nstart = 25)
km

c(wss[3], sum(km$withinss))

# prepare the student data and clustering results for plotting
df = as.data.frame(kmdata_orig[,2:4])
df$cluster = factor(km$cluster)
centers = as.data.frame(km$centers)

g1 = ggplot(data = df, aes(x = English, y = Math, color = cluster )) +
  geom_point() + theme(legend.position = "right") +
  geom_point(data = centers, aes(x = English, y = Math, color = as.factor(c(1, 2, 3))), size = 10, alpha = .3, show_guide = FALSE)

g2 =ggplot(data = df, aes(x = English, y = Science, color = cluster )) +
  geom_point() +
  geom_point(data = centers, aes(x = English, y = Science, color = as.factor(c(1, 2, 3))), size = 10, alpha = .3, show_guide = FALSE)

g3 = ggplot(data = df, aes(x = Math, y = Science, color = cluster )) +
  geom_point() +
  geom_point(data = centers, aes(x = Math, y = Science, color = as.factor(c(1, 2, 3))), size = 10, alpha = .3, show_guide = FALSE)

tmp = ggplot_gtable(ggplot_build(g1))

grid.arrange(
  arrangeGrob(
    g1 + theme(legend.position = "none"), 
    g2 + theme(legend.position = "none"), 
    g3 + theme(legend.position = "none"),
    main = "High School Student Cluster Analysis",
    ncol = 1
  )
)

