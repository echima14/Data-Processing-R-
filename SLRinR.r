# Simple Linear Regression

# Importing the Libraries
# We don't need to import any libraries

# Importing the Dataset
dataset = read.csv('Salary_Data.csv')

#Splitting the dataset into a Training set and a test set
install.packages('caTools')
library(caTools)
set.seed(123) # This is so we get the same results
split = sample.split(dataset$Salary, SplitRatio = 2/3) # this is for the training set 66.6%
training_set = subset(dataset,split == TRUE)
test_set = subset(dataset,split==FALSE)

# Feature Scaling 
# Age & Salary are not on the same scale
#training_set[ ,2:3] = scale(training_set[ ,2:3])
#test_set[ ,2:3] = scale(test_set[ ,2:3])

# The libraries we will use will do the feature scaling for us
# We can press F1 to examine lm

regressor = lm(formula = Salary ~ YearsExperience,data = training_set)

# Summary(regressor) You can run this in the console

# Predict the test results

y_pred = predict(regressor,newdata = test_set)

# Visualize the training set results

#install.packages('ggplot2')

library(ggplot2)
ggplot()+
  geom_point(aes(x=training_set$YearsExperience,y = training_set$Salary),
             colour = 'blue') +
  geom_line(aes(x=training_set$YearsExperience, y = predict(regressor,newdata = training_set)),colour ='red') +
  ggtitle('Salary vs Years Experience(Training Set)')+
  xlab('Years Experience')+
  ylab('Salary')
ggsave('trainingset.pdf')
ggsave('trainingset.png')

# Visualize the test set results
#install.packages("ggplot2")

#library(ggplot2)
ggplot( ) +
  geom_point(aes(x=test_set$YearsExperience, y = test_set$Salary),
             colour = 'blue') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor,newdata = training_set)),
            colour = 'green') +
  ggtitle('Salary vs Experience (Test Set)')+
  xlab('Years of Experience') +
  ylab('Salary')
#ggsave('testSet.png')
