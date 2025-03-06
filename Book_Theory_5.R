# Decision Trees 

library("rpart")
library("rpart.plot")
library(e1071)
library(lattice)
library(ROCR)

play_decision <- read.table("./Data/DTdata.csv", header = TRUE, sep = ",")
play_decision
summary(play_decision)

fit <- rpart(Play ~ Outlook + Temperature + Humidity + Wind, method = "class", data = play_decision, control = rpart.control(minsplit = 1), parms = list(split = "information"))
summary(fit)
rpart.plot(fit, type = 4, extra = 1)
rpart.plot(fit, type = 4, extra = 2, clip.right.labs = FALSE, varlen = 0, faclen = 0)

newdata <- data.frame(Outlook = "rainy", Temperature = "mild", Humidity = "high", Wind = FALSE)
newdata
predict(fit, newdata = newdata, type = "prob")
predict(fit, newdata = newdata, type = "class")

# Naive Bayes
sample <- read.table("./Data/sample1.csv", header = TRUE, sep = ",") # read the data into a table from the file
traindata <- as.data.frame(sample[1:14,]) # define the data frames for the NB classifier
testdata <- as.data.frame(sample[15,])
traindata
testdata

tprior <- table(traindata$Enrolls)
tprior

tprior <- tprior/sum(tprior)
tprior

ageCounts <- table(traindata[,c("Enrolls", "Age")])
ageCounts

ageCounts <- ageCounts/rowSums(ageCounts)
ageCounts

incomeCounts <- table(traindata[,c("Enrolls", "Income")])
incomeCounts <- incomeCounts/rowSums(incomeCounts)
incomeCounts

jsCounts <- table(traindata[,c("Enrolls", "JobSatisfaction")])
jsCounts <- jsCounts/rowSums(jsCounts)
jsCounts

desireCounts <- table(traindata[,c("Enrolls", "Desire")])
desireCounts <- desireCounts/rowSums(desireCounts)
desireCounts

prob_yes <- ageCounts["Yes",testdata[,c("Age")]] * incomeCounts["Yes",testdata[,c("Income")]] * jsCounts["Yes",testdata[,c("JobSatisfaction")]] * desireCounts["Yes",testdata[,c("Desire")]] * tprior["Yes"]
prob_no <- ageCounts["No",testdata[,c("Age")]] * incomeCounts["No",testdata[,c("Income")]] * jsCounts["No",testdata[,c("JobSatisfaction")]] * desireCounts["No",testdata[,c("Desire")]] * tprior["No"]
max(prob_yes, prob_no)
prob_yes
prob_no

model <- naiveBayes(Enrolls ~ Age + Income + JobSatisfaction + Desire, traindata)
model

results <- predict(model, testdata) # predict with test data
results

model1 = naiveBayes(Enrolls ~., traindata, laplace = .01) # use the NB classifier with Laplace smoothing
model1

results1 <- predict (model1, testdata) # predict with test data
results1

# Linear Regression example
income_input = as.data.frame(read.csv("./Data/income.csv"))
income_input[1:10,]
summary(income_input)

splom(~income_input[c(2:5)], groups = NULL, data = income_input, axis.line.tck = 0, axis.text.alpha = 0)
results <- lm(Income~Age + Education + Gender, income_input)
summary(results)

results2 <- lm(Income ~ Age + Education, income_input)
summary(results2)

confint(results2, level = .95)

Age <- 41
Education <- 12
new_pt <- data.frame(Age, Education)
conf_int_pt <- predict(results2, new_pt, level = .95, interval = "confidence")
conf_int_pt

pred_int_pt <- predict(results2, new_pt, level = .95, interval = "prediction")
pred_int_pt

# Diagnostics (Residual plots)
with(results2, {
  plot(fitted.values, residuals, ylim = c(-40, 40))
  points(c(min(fitted.values), max(fitted.values)), c(0, 0), type = "l")
})

hist(results2$residuals, main = "")
qqnorm(results2$residuals, ylab = "Residuals", main = "")
qqline(results2$residuals)

# Logistic Regression example
churn_input <- data.frame(
  ID = c(1, 2, 3, 4, 5, 6),
  Churned = c(0, 0, 0, 0, 0, 1),
  Age = c(61, 50, 47, 50, 29, 43),
  Married = c(1, 1, 1, 1, 1, 1),
  Cust_years = c(3, 3, 2, 3, 1, 4),
  Churned_contacts = c(1, 2, 0, 3, 3, 3)
)
head(churn_input)
sum(churn_input$Churned)

Churn_logistic1 <- glm(Churned ~ Age + Married + Cust_years + Churned_contacts, data = churn_input, family = binomial(link = "logit"))
summary(Churn_logistic1)

Churn_logistic3 <- glm(Churned ~ Age + Churned_contacts, data = churn_input, family = binomial(link = "logit"))
summary(Churn_logistic3)

pred = predict(Churn_logistic3, type = "response")
predObj = prediction(pred, churn_input$Churned)
rocObj = performance(predObj, measure = "tpr", x.measure = "fpr")
aucObj = performance(predObj, measure = "auc")
plot(rocObj, main = paste("Area under the curve:", round(aucObj@y.values[[1]], 4)))

# extract the alpha(threshold), FPR, and TPR values from rocObj
alpha <- round(as.numeric(unlist(rocObj@alpha.values)), 4)
fpr <- round(as.numeric(unlist(rocObj@x.values)), 4)
tpr <- round(as.numeric(unlist(rocObj@y.values)), 4)

# adjust margins and plot TPR and FPR
par(mar = c(5,5,2,5))
plot(alpha, tpr, xlab = "Threshold", xlim = c(0, 1), ylab = "True positive rate", type = "l")
par(new = "True")
plot(alpha, fpr, xlab = "", ylab = "", axes = F, xlim = c(0, 1), type = "l" )
axis(side = 4)
mtext(side = 4, line = 3, "False positive rate")
text(0.18, 0.18, "FPR")
text(0.58, 0.58, "TPR")

i <- which(round(alpha, 2) == .5)
paste("Threashold=", (alpha[i]), "TPR=", tpr[i], "FPR=", fpr[i])

i <- which(round(alpha, 2) == .15)
paste("Threashold=", (alpha[i]), "TPR=", tpr[i], "FPR=", fpr[i])
