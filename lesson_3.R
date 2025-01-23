# Complete Linkage Clustering

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

