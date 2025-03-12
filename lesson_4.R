library(e1071)

income <- c("high", "high", "medium", "low", "medium", "low")
works <- c("no", "yes", "yes", "yes", "yes", "no")
loan <- c("yes", "yes", "yes", "yes", "yes", "no")
df <- data.frame(income, works, loan)
df

nb_mod <- naiveBayes(loan ~ ., data = df, laplace = 0)
nb_mod

income <- c("low")
works <- c("no")
test <- data.frame(income, works)
pred <- predict(nb_mod, test, type = "raw")
pred

x <- c(1, 2, 4, 5, 6)
y <- c(1, 2, 3, 3, 4)
model <- lm(y~x)
summary(model)

data(mtcars) # Load the dataset
str(mtcars) # Inspect the dataset
print(head(mtcars)) # Output first lines

mtcars$am <- factor(mtcars$am, levels = c(0, 1), labels = c("Automatic", "Manual")) # Convert 'am' (transmission type) to a factor with labels for clarity
logistic_model <- glm(am ~ hp + wt, data = mtcars, family = binomial) # Predict transmission type (am) using horsepower (hp) and weight (wt)
print(summary(logistic_model)) # summary of the model

predicted_probs <- predict(logistic_model, type = "response") # Make predictions (probabilities)
mtcars$predicted_prob <- predicted_probs # Add predicted probabilities to the dataset
mtcars$predicted_class <- ifelse(predicted_probs > 0.5, "Manual", "Automatic") # Convert probabilities to predicted classes (threshold = 0.5)
print(head(mtcars)) # Inspect the results

print(table(Predicted = mtcars$predicted_class, Actual = mtcars$am)) # Evaluate the model accuracy (confusion matrix)
