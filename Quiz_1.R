# Quiz 1

# Question 1:
print(prod(rep(2, 5)))
print(sum(rep(2, 5)))
print(prod(seq(2), 5))
print(prod(seq(2:5)))

# Question 2:
x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
y <- c(100, 105, 98, 110, 95, 102, 99, 101, 97, 103)
print(cor(x, y, method = "pearson"))

# Question 3:
x <- c(10, 11, 15, 18, 26)
y <- c(110, 123, 170, 213, 347)
print(cor(x, y,method = "pearson"))

# Question 5:
matrix1 <- matrix(1:6, nrow = 2)
matrix2 <- matrix(7:12, nrow = 2)
print(cbind(matrix1, matrix2))

# Question 9:
x <- c(19, 23, 14, 17, 28)
y <- c(115, 128, 108, 190, 205)
print(cor(x, y, method = "pearson"))

# Question 10:
y <- 8
y[y < 0] <- -y[y < 0]
print(y[y < 0])

y[is.na(y)] <- 0
print(y[is.na(y)])

y[!is.na(y)] <- -y
print(y[!is.na(y)])

y[y>0] <- -y[y>0]
print(y[y>0])

y <- abs(y)
print(y)
