#Polynomial Regression
#ISC 215
#March 30, 2017

#Importing dataset
dataset = read.csv('Position_Salary_Data_Set.csv')
dataset = dataset[2:3]

#Fitting the linear regressor to the dataset
LinReg = lm(formula = Salary ~.,
            data = dataset)
summary(LinReg)

#Fitting the polynomial regressor to the dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
dataset$Level5 = dataset$Level^5
PolyReg = lm(formula = Salary~.,
             data = dataset)
#dataset$Salary

#Visualizing the linear regressor
library(ggplot2)
ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red')+
  geom_line(aes(x = dataset$Level, y = predict(LinReg, newdata = dataset)),
            colour = 'blue')+
  ggtitle('Salary Prediction(Linear)')+
  xlab('Level')+
  ylab('Salary')

#Polynomial Regression
ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red')+
  geom_line(aes(x = dataset$Level, y = predict(PolyReg, newdata = dataset)),
            colour = 'blue')+
  ggtitle('Salary Prediction(PolyReg)')+
  xlab('Level')+
  ylab('Salary')

#Predicting the linear results
predictFunction = predict(LinReg,data.frame(Level = 6.5))

#Predicting the polynomial results
PolyPredict = predict(PolyReg,data.frame(Level = 6.5,
                                         Level2 = 6.5^2,
                                         Level3 = 6.5^3,
                                         Level4 = 6.5^4,
                                         Level5 = 6.5^5))

