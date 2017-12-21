#getwd()
#setwd("C:/Users/Thinkpad15/Desktop/Online Classes/ALL R/R Brainwave")
library(ISLR)
attach(Carseats)
head(Carseats)
mytable <-data.frame(sales = Carseats$Sales,  income = Carseats$Income,adv = Carseats$Advertising,
                     age = Carseats$Age, education = Carseats$Education )
mytable
library(rpart)
fit <- rpart( sales~   income +adv+age + education, data=mytable)
             
plot(fit)
text(fit, use.n = TRUE)
summary(fit)


cor(mytable)
plot(mytable[,1], mytable[,3])
