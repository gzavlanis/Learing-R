n <- floor(rnorm(10000, 500, 100))
t <- table(n)
barplot(t)

x <- 10
y <- 1:4
z <- 2:5

print(y * z) # multiplication
print(c(y, z)) # concatenation
print(c(1:3, c(4:6, 7:10))) # recursive execution

x <- 1:3 ; print(rep(x, 2)) # repetition
y <- 1:3 ; print(rep(y, c(1, 3, 2)))
print(sum(rep(x, 2)))

greeting <- "My name is George!"
print(greeting)