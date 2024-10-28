# Data Loading

# Editing and printing
data(iris)
print(ls())
# print(help("iris")) # helpin data

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
