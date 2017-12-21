getwd()
setwd("C:/Users/Thinkpad15/Desktop/Online Classes/ALL R/R Brainwave")
library(randomForest)
bwtable <- read.csv("bwdata.csv", header = TRUE)#download brain wave data as bwtable
bwtable

#################use this for all train, all test ##############################
training.data = rbind(bwtable[1:14,], bwtable[15:28,])
training.data
test.data = rbind(bwtable[1:14,], bwtable[15:28,])
test.data

#########1:10 - train , and 11-14 test :

training.data = rbind(bwtable[1:10,], bwtable[15:24,])
training.data
test.data = rbind(bwtable[11:14,], bwtable[25:28,])
test.data

###############################################

fit=randomForest(class~delta+beta,data=training.data)
summary(fit)
model.predict = predict(fit,test.data)
model.predict


bwtable$predict <- model.predict
bwtable 
