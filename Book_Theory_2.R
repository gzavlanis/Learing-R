# Statistical Methods for Evaluation book examples

# generate random observations from the two populations
x <- rnorm(10, mean = 100, sd = 5) # normal distribution centered at 100
y <- rnorm(20, mean = 105, sd = 5) # normal distribution centered at 105

t.test(x, y, var.equal = TRUE) # run the Student's t-test
qt(p = 0.05/2, df = 28, lower.tail = FALSE) # obtain t value for a two-sided test at a 0.05 significance level

t.test(x, y, var.equal = FALSE) # run the Welch's t-test
wilcox.test(x, y, conf.int = TRUE)

# Simulated 500 observations of purchase sizes on the 3 offer options
offers <- sample(c("offer1", "offer2", "nopromo"), size = 500, replace = T)
purchasesize <- ifelse(offers == "offer1", rnorm(500, mean = 80, sd = 30),
                ifelse(offers == "offer2", rnorm(500, mean = 85, sd = 30),
                       rnorm(500, mean = 40, sd = 30)))

offertest <- data.frame(offer = as.factor(offers), purchase_amt = purchasesize) # create a data frame of offer option and purchase size
summary(offertest[offertest$offer == "offer1",]) # display a summary of offertest where offer = "offer1"
summary(offertest[offertest$offer == "offer2",]) # display a summary of offertest where offer="offer2"
summary(offertest[offertest$offer == "nopromo",]) # display a summary of offertest where offer="nopromo"

model <- aov(purchase_amt ~ offers, data = offertest) # fit ANOVA test
summary(model)
TukeyHSD(model)
