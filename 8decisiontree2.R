#getwd()
#setwd("C:/Users/Thinkpad15/Desktop/Online Classes/ALL R/R Brainwave")
bwtable <- read.csv("bwdata.csv", header = TRUE)#download brain wave data as bwtable
bwtable

library(rpart)
fit <- rpart( class~theta+beta+delta, data=bwtable)

plot(fit)
text(fit, use.n = TRUE)
summary(fit)
