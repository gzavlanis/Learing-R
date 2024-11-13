# Introduction to R (book examples)

library(matrixcalc)
library(ggplot2)
data(diamonds)

i <- 1
sport <- "football"
flag <- TRUE

class(i)
typeof(i)

class(sport)
typeof(sport)

class(flag)
typeof(flag)

is.integer(i)

j <- as.integer(i)
is.integer(j)

length(i)
length(flag)
length(sport)

is.vector(i)
is.vector(flag)
is.vector(sport)

u <- c("red", "yellow", "blue")
u
u[1]

v <- 1:5
v
sum(v)

w <- v * 2
w
w[3]

z <- v + w
z
z > 8
z[z > 8]
z[z > 8 | z < 5]

a <- vector(length = 3)
a

b <- vector(mode = "numeric", 3)
typeof(b)

b[2] <- 3.1
b

c <- vector(mode = "integer", 0)
c
length(c)

length(b)

# the dimensions are 3 regions, 4 quarters, and 2 years
quarterly_sales <- array(0, dim = c(3, 4, 2))
quarterly_sales[2, 1, 1] <- 158000
quarterly_sales

M <- matrix(c(1, 3, 3, 5, 0, 4, 3, 3, 3), nrow = 3, ncol = 3) # build a 3x3 matrix
M %*% matrix.inverse(M) # multiply M by inverse (M)

# build an assorted list of a string, a numeric, a list, a vector and a matrix
housing <- list("own", "rent")
assortment <- list("football", 7.5, housing, v, M)
assortment

# examine the fifth object, M, in the list
class(assortment[5])
length(assortment[5])
class(assortment[[5]])
length(assortment[[5]])
str(assortment)

# factors
str(diamonds)
head(diamonds$cut) # display first six values and the levels
