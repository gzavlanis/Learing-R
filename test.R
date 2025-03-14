n <- floor(rnorm(10000, 500, 100))
t <- table(n)
barplot(t)

x <- 10
a <- 2
y <- 1:4
z <- 2:5

print(x > a)
print(x + a)

if (x > a) {
    print("Yes.")
} else {
    print("No.")
}

print(y * z) # multiplication
print(c(y, z)) # concatenation
print(c(1:3, c(4:6, 7:10))) # recursive execution

x <- 1:3 ; print(rep(x, 2)) # repetition
y <- 1:3 ; print(rep(y, c(1, 3, 2)))
print(sum(rep(x, 2)))

greeting <- "My name is George!"
print(greeting)

#make a plot
bar_values <- c(3, 5, 8, 2, 9)
bar_names <- c("A", "B", "C", "D", "E")

barplot(bar_values, names.arg = bar_names, col = "blue") # barplot
hist(iris$Petal.Length) # histogram
boxplot(iris$Sepal.Length ~ iris$Species) # boxplot

