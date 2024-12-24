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

# Exploratory Data Analysis

x <- rnorm(50)
y <- x + rnorm(50, mean = 0, sd = 0.5)
data <- as.data.frame(cbind(x, y))
summary(data)

ggplot(data, aes(x = x, y = y)) +
  geom_point(size = 2) +
  ggtitle("Scatterplot of X and Y") +
  theme(axis.text = element_text(size = 12), axis.title = element_text(size = 14),
        plot.title = element_text(size = 20, face = "bold"))

data(anscombe) # load the anscombe dataset into the current workspace
anscombe

nrow(anscombe) # number of rows

# generates levels to indicate which group each data point belongs to
levels <- gl(4, nrow(anscombe))
levels

# Group anscombe into a data frame
mydata <- with(anscombe, data.frame(x = c(x1, x2, x3, x4), y = c(y1, y2, y3, y4), mygroup = levels))
mydata

# Make scatterplots using the ggplot2 package
theme_set(theme_bw()) # set plot color theme
ggplot(mydata, aes(x, y)) + geom_point(size = 4) + geom_smooth(method = "lm", fill = NA, fullrange = TRUE) +
  facet_wrap(~mygroup)

# Dirty Data
x <- c(1, 2, 3, NA, 4)
is.na(x)
mean(x)
mean(x, na.rm = TRUE)

DF <- data.frame(x = c(1, 2, 3), y = c(10, 20, NA))
DF

DF1 <- na.exclude(DF)
DF1

# Visualizing a Single Variable
data(mtcars)
dotchart(mtcars$mpg, labels = row.names(mtcars), cex = .7, main = "Miles Per Gallon (MPG) of Car Models", 
         xlab = "MPG")

barplot(table(mtcars$cyl),main = "Distribution of car Cylinder Counts",
        xlab = "Number of Cylinders")

# randomly generate 4000 observations from the log normal distribution
income <- rlnorm(4000, meanlog = 4, sdlog = 0.7)
summary(income)
income <- 1000 * income
summary(income)

hist(income, breaks = 500, xlab = "Income", main = "Histogram of Income") # plot the histogram

plot(density(log10(income), adjust = 0.5), main = "Distribution of Income (log10 scale)") # density plot
rug(log10(income)) # add rug to the density plot

data(diamonds)
niceDiamonds <- diamonds[diamonds$cut == "Premium" | diamonds$cut == "Ideal",] # only keep the premium and ideal cuts
summary(niceDiamonds$cut)

ggplot(niceDiamonds, aes(x = price, fill = cut)) + geom_density(alpha = .3, color = NA) # plot density plot of prices
ggplot(niceDiamonds, aes(x = log10(price), fill = cut)) + geom_density(alpha = .3, color = NA) # plot density plot of log10 of prices

# Examining multiple variables
# 75 numbers between 0 and 10 of uniform distribution
x <- runif(75, 0, 10)
x <- sort(x)
y <- 200 + x^3 - 10 * x^2 + x + rnorm(75, 0, 20)

lr <- lm(y ~ x) # linear regression
poly <- loess(y ~ x) # LOESS
fit <- predict(poly) # fit a nonlinear line

plot(x, y)
points(x, lr$coefficients[1] + lr$coefficients[2] * x, type = "l", col = 2) # draw the fitted line for the linear regression
points(x, fit, type = "l", col = 4) # draw the fitted line with LOESS

cars <- mtcars[order(mtcars$mpg),] # sort by mpg
cars$cyl <- factor(cars$cyl) # grouping variable must be a factor
cars$color[cars$cyl == 4] <- "red"
cars$color[cars$cyl == 6] <- "blue"
cars$color[cars$cyl == 8] <- "darkgreen"

dotchart(cars$mpg, labels = row.names(cars), cex = .7, groups = cars$cyl, 
         main = "Miles Per Gallon (MPG) of Car Models\nGrouped by Cylinder",
         xlab = "Miles Per Gallon", color = cars$color, gcolor = "black")

counts <- table(mtcars$gear, mtcars$cyl)
barplot(counts, main = "Distribution of Car Cylinder Counts and Gears", xlab = "Number of Cylinders", ylab = "Counts",
        col = c("#0000FFFF", "#0080FFFF", "#00FFFFFF"), legend = rownames(counts), beside = TRUE,
        args.legend = list(x = "top", title = "Number of Gears"))

# Scatter plot Matrix
colors <- c("red", "green", "blue") # define colors
pairs(iris[1:4], main = "Fisher's Iris Dataset", pch = 21, bg = colors[unclass(iris$Species)]) # draw the plot matrix
par(xpd = TRUE) # set graphical parameter to clip plotting to the figure region
legend(0.2, 0.02, horiz = TRUE, as.vector(unique(iris$Species)), fill = colors, bty = "n") # add legend

plot(AirPassengers) # analyzing a variable over time

income = rlnorm(5000, meanlog = log(40000), sdlog = log(5)) # generate random log normal income data

# Part 1: Create the density plot
plot(density(log10(income), adjust = 0.5), main = "Distribution of Account Values (log10 scale)")
rug(log10(income)) # Add rug to the density plot

# Part 2: Make the histogram:
breaks = c(0, 1000, 5000, 10000, 50000, 100000, 5e5, 1e6, 2e7) # create log-like bins
bins = cut(income, breaks, include.lowest = TRUE, labels = c("< 1K", "1-5K", "5-10K", "10-50K", "50-100K", "100-500K", "500K-1M","> 1M")) # 
plot(bins, main = "Distribution of Account values", xlab = "Account value ($ USD)", ylab = "Number of Accounts", col = "blue")
