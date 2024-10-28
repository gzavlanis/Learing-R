# R Lesson 1

# Types of variables
x <- 10
y <- -3.1415
z <- "Hello world" # string
u <- -1:10 # vector
v <- 1:12

# factors (similar to enumeratedtypes in C)
gender <- factor(c("male", "female"))

# Arithmetic operators and variables
print(y) # printing a value
print(2 * y)
print(u)

print(2:-2)
print(sqrt(v))
print(sqrt(x * v))
print(u - v)

# Basic operations and variables
x <- 1:4
y <- 5:8
print(c(x, y)) # concatenation
print(c(1:3, c(4:6, 7:10)))

print(rep(x, 2)) # repetition
x <- 1:3
print(rep(x, c(1, 3, 2)))

x <- seq(1, 4) #sequence
print(x)
x <- seq(1, 5, by = 2)
print(x)
x <- seq(1, 7, length = 4)
print(x)
x <- c("Hello", c(" ", "world"))
print(x)

# Useful functions
x <- 1:4
print(sum(x)) # sum
print(sum(rep(x, 2)))
print(sum(x ^ 2))

print(str(x)) # structure
print(summary(x)) # summary
print(sum(rep(-2:2, 2)))
print(sum(rep(-2:2, 2) ^ 2))

# Basic operations of variables
print(length(x)) # length
y <- 2
print(ls()) #ls

rm(x)
print(ls()) # remove x from memory

# Variables
a <- c(1, 2, 5.3, 6, -2, 4) # numeric vector
b <- c("one", "two", "three") # character vector
c <- c(TRUE, TRUE, TRUE, FALSE, TRUE, FALSE) # logical vector

# combining vectors
fruits <- c("Apples", "Oranges", "Blackberries")
vegetables <- c("Broccoli", "Spinach", "Tomatoes")
basket_items <- c(fruits, vegetables)
print(basket_items)

# Lists
x <- 1:3
y <- 4
z <- "Text"
newList <- list(x, y, z)
print(newList)
print(newList[1])

# Dataframes
age <- c(1, 2, 4)
height <- c(75, 87, 102)
weight <- c(10.0, 12.1, 17.0)
dataframe <- data.frame(age, height, weight)
print(dataframe)

# Dataframes slicing with Square Brackets
print(dataframe[1:2, ])
print(dataframe[, c("age", "height")])
print(dataframe[1:2, c("age", "height")])

print(dataframe[dataframe$age > 1, ]) # With Logical indexing
print(subset(dataframe, weight == "10")) # with the subset() function

# Accessing items with the use of $:
age <- c(1, 2, 4)
height <- c(75, 87, 102)
weight <- c(10.0, 12.1, 17.0)
dataframe <- data.frame(age, height, weight)

print(dataframe)
print(dataframe$height)
print(dataframe$weight[2])
dataframe$weight[3] <- 18
print(dataframe$weight[3])

# Matrices
x <- 1:3
y <- 4:6
z <- cbind(x, y)
print(z)

w <- rbind(x, y)
print(w)

# Create a matrix from vector
x <- 1:8
y <- matrix(x, nr = 2)
print(y)

z <- matrix(x, nr = 2, byrow = TRUE)
print(z)

print(matrix(c(1, 2, 3, 4, 5, 6), nr = 2))
x <- 1:8
y <- matrix(x, nrow = 2)

# Basic operations on matrices
x <- 1:8
y <- matrix(x, nr = 2)
print(y)
print(y[1, 2]) # accessing elements of a matrix [row, column]
print(dim(y)) # matrix dimensions
print(summary(y)) # summary of a matrix

# Functions
cube <- function(x) x^3 # new inline function
print(cube(2))

# A bigger function
cubePlus1 <- function(x) {
    tmpCube <- cube(x)
    return(tmpCube + 1)
}

print(cubePlus1(2))
# fix(cubePlus1) # editing of functions
