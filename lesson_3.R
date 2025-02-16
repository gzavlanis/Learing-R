# Complete Linkage Clustering

library("mixtools")
library(ggplot2)
library(cluster)
library(factoextra)
library(arules)
library(e1071)

# Define the distance matrix
dist_matrix <- matrix(
  c(0, 2, 6, 10, 9, 2, 0, 5, 9, 8, 6, 5, 0, 4, 5, 10, 9, 4, 0, 3, 9, 8, 5, 3, 0),
  nrow = 5,
  byrow = TRUE
)

# Since hclust needs the distance as a "dist" object, we need to convert our matrix.
# We use only the upper triangle of the matrix without the diagonal
dist_object <- as.dist(dist_matrix)
hc <- hclust(dist_object, method = "complete") # Perform complete linkage clustering
plot(hc, labels = c("A", "B", "C", "D", "E"), main = "Complete Linkage Dendrogram") # Plot the dendrogram

d <- read.csv("./Data/sex_height_weight.csv", header = T, sep = ",")
mat <- cbind(d$Height, d$Weight)
m <- mvnormalmixEM(mat, k = 2)
m$mu

grade_input = as.data.frame(read.csv("./Data/grades_km_input.csv")) # import the student grades
kmdata_orig = as.matrix(grade_input[,c("Student", "English", "Math", "Science")])
kmdata <- kmdata_orig[,2:4]
kmdata[1:10,]

wss <- numeric(15)
for (j in 1:15) wss[k] <- sum(kmeans(kmdata, centers = k, nstart = 25)$withinss)
plot(1:15, wss, type="b", xlab="Number of Clusters", ylab="WithinSum of Squares")

km = kmeans(kmdata, 3, nstart = 25)
km

c(wss[3], sum(km$withinss))

# Exercise in K-means
data(ruspini) # load the dataset
wss <- numeric(15) # initialize a numeric vector to store the within-clusetr sum of squares (WSS) for different k values

# Loop over k values from 1 to 15 to calculate the wss for each number of clusters
for (k in 1:15) {
  wss[k] <- sum(kmeans(ruspini, centers = k, nstart = 25)$withinss)
}

# Plot the wss against the number of clusters(k) to visualize the elbow method
plot(1:15, wss, type = "b", xlab = "Number of Clusters", ylab = "Within Sum of Squares")
rusp <- kmeans(ruspini, 4, nstart = 25) # Perform k-means clustering on the Ruspini dataset witn the chosen number of clusters (4)
print(rusp) # print results
c(wss[4], sum(rusb$withinss)) # Compare the WSS value for k = 4 obtained in the loop with the sum of the within-cluster sums of squares

fviz_cluster(rusp, data = ruspini, geom = "point") # Visualize the clusters obtained from the k-means analysis

# Association rules in R
basket <- list(c("apple", "beer", "rice", "meat"), c("apple", "beer", "rice"), c("apple", "beer"))
trans <- as(basket, "transactions")
rules <- apriori(trans, parameter = list(susp = 0.3, conf = 0.5, maxlen = 10, target = "rules"))
beer_rules <- apriori(trans, parameter = list(supp = 0.3, conf = 0.5, maxlen = 10, minlen = 2), appearance = list(default = "lhs", rhs = "beer"))
inspect(beer_rules)

income <- c("high", "high", "medium", "low", "medium", "low")
works <- c("no", "yes", "yes", "yes", "yes", "no")
loan <- c("yes", "yes", "yes", "yes", "yes", "no")

df <- data.frame(income, works, loan)
df

mb_mod <- naiveBayes(loan ~ ., data = df, laplace = 0)
mb_mod

income <- c("low")
works <- c("no")
test <- data.frame(income, works)

pred <- predict(nb_mod, test, type = "raw")
pred
