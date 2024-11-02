# Data Loading

# Editing and printing
data(iris)
print(ls())
print(help("iris")) # help in data

# edit(iris) # edit data
print(head(iris))
print(str(iris))

# Importing data:
# first row contains variable names, comma is separator
# assign the variable id to row names
# note the / instead of \ on mswindows systems
mydata <- read.table("./data/Cereals.csv", header = TRUE, sep = ",")
print(head(mydata))

# Exercises set 1:
# 1.
a <- c(1, 2, 3)
b <- c(4, 5, 6)
c <- c(7, 8, 9)
m <- cbind(a, b, c)
print("Content of the said matrix:")
print(m)

# 2.
df <- read.table("./Data/Table0.txt")
print(df)
names(df) <- c("Name", "Age", "Height", "Weight", "Sex")
row.names(df) <- df$Name
df$Name <- NULL
print(df)

# 3.
df <- read.table("./Data/Table1.txt", header = TRUE)
print(dim(df))

df <- read.table("./Data/Table1.txt", header = TRUE, row.names = "Name", stringsAsFactors = FALSE)
print(lapply(df, class))

# Exercises set 2:
# 1.
cereals <- read.csv("./Data/Cereals.csv")
print(str(cereals))
print(head(cereals))

# 2.
print(cereals$totalcarb <- cereals$carbo + cereals$sugars)

# 3.
# using subset on the dataframe
hotcereals <- subset(cereals, Cold.or.Hot == "H")
print(nrow(hotcereals))

# 4.
print(length(unique(cereals$Supplier)))

# 5.
K_cereals <- subset(cereals, Supplier == "K")
print(K_cereals)

# 6.
print(subset(cereals, calories < 80 & vitamins > 20))

# 7.
cereal_subs <- subset(cereals, sugars >= 1, select = c(Cereal.name, calories, vitamins))
print(head(cereal_subs))

# 8.
write.csv(cereal_subs, "./Data/cerealsubset.csv", row.names = FALSE)

# 9.
print(names(cereals))
names(cereals)[2] <- "Producer"
print(names(cereals))

# Data visualization

# Bar Chart
y <- c(35, 80, 20, 62, 90, 40)
x <- c("a", "b", "c", "d", "e", "f")
barplot(y, names.arg = x, xlab = "categorical attribute", ylab = "frequency")

# Histogram
hist(iris$Petal.Length)
hist(iris$Petal.Length, breaks = c(1.0, 3.0, 4.0, 4.5, 6.9))

# Boxplot
boxplot(iris$Sepal.Length ~ iris$Species)

# Boxplot using a random sample from a standard normal distribution
norm100 <- rnorm(100, 0, 1)
norm1000 <- rnorm(1000, 0, 1)
boxplot(norm100, norm1000, notch = TRUE, names = c("n=100", "n=1000"))

# Boxplot using a random sample from an exponential distribution
exp1000 <- rexp(n = 1000, rate = 1)
exp100 <- rexp(n = 100, rate = 1)
boxplot(exp1000, exp100, notch = TRUE, names = c("n=1000", "n=100"))

# Exercises:
data(islands)
print(length(islands))

print(mean(islands))
print(median(islands))

print(range(islands)[1])
print(range(islands)[2])

print(sd(islands))
print(quantile(islands))
print(quantile(islands, c(.05, .95)))
print(IQR(islands))

hist(islands)
hist(islands, prob = TRUE)

boxplot(islands)
boxplot(islands, outline = FALSE)

# Visualization Methods for Two Attributes

# Scatter Plot
plot(
    jitter(iris$Sepal.Length), jitter(iris$Sepal.Width),
    pch = c(23, 24, 25)[unclass(iris$Species)],
    bg = c("red", "green3", "blue")[unclass(iris$Species)]
)

plot(
    jitter(iris$Petal.Length), jitter(iris$Petal.Width),
    pch = c(23, 24, 25)[unclass(iris$Species)],
    bg = c("red", "green3", "blue")[unclass(iris$Species)]
)
legend(
    5, 0.7, legend = c("Virginica", "Versicolor", "Setosa"),
    fill = c("blue", "green3", "red")
)
