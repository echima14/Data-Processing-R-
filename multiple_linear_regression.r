# Multiple Linear Regression

# Import data set
dataset = read.csv('StartUp.csv')

# Encoding the categorical data
dataset$State = factor(dataset$State,
                       levels = c('New York','California','Florida'),
                       labels = c(1,2,3))

# Split into training and test set
#install.packages(caTools)
library('caTools')
set.seed(123)
split = sample.split(dataset$Profit,SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#regressor = lm(formula = Profit ~ Technology.Budget + Human.Resources + Advertising + State)
regressor = lm(formula = Profit ~ .,
               data = training_set)

y_Predictions = predict(regressor,newdata = test_set)
summary(regressor)

# Backwards Elimination
regressor = lm(formula = Profit ~ Technology.Budget + Advertising + Human.Resources, data = training_set)
summary(regressor)

regressor = lm(formula = Profit ~ Technology.Budget + Advertising, data = training_set)
summary(regressor)

regressor = lm(formula = Profit ~ Technology.Budget, data = training_set)
summary(regressor)