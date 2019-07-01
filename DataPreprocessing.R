# Data Preprocessing

# importing the Libraries
# We don't need to import any libraries

# importing the Dataset
dataset = read.csv('Data.csv')

# Correct for missing data
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x)mean(x,na.rm = TRUE)),
                     dataset$Age)
dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN = function(x)mean(x,na.rm = TRUE)),
                        dataset$Salary)

# Take care of categorical data
dataset$State = factor(dataset$State,
                       levels = c('New York','Ohio','Vermont'),
                       labels = c(1,2,3))
dataset$Purchased = factor(dataset$Purchased,
                           levels = c('No','Yes'),
                           labels = c(0,1))

#Splitting the dataset into a Training set and a test set
#install.packages('caTools')
library(caTools)
set.seed(123) # This is so we get the same results
split = sample.split(dataset$Purchased, SplitRatio = 0.8) # this is for the training set 80%
training_set = subset(dataset,split == TRUE)
test_set = subset(dataset,split==FALSE)

#Feature Scaling 
# Age & Salary are not on the same scale

training_set[ ,2:3] = scale(training_set[ ,2:3])
test_set[ ,2:3] = scale(test_set[ ,2:3])