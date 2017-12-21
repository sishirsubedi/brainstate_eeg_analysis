getwd()

bwtable.all <- read.csv("bwdata.csv", header = TRUE)#download brain wave data as bwtable
bwtable.all

bwtable <- data.frame(Delta.waves = bwtable.all[,1],Beta.waves = bwtable.all[,4],class = bwtable.all[,6])
bwtable



############train all, and test alll.....-->
training.data = rbind(bwtable[1:14,], bwtable[15:28,])
training.data
test.data = rbind(bwtable[1:14,], bwtable[15:28,])
test.data

##################################

#install.packages("e1071")
library(e1071)


model = svm(class~Delta.waves+Beta.waves,data=training.data, kernel = "linear")
model
summary(model)

png("Brainwave_SVM.png")
theme_set(theme_gray(base_size = 25))
plot(model, bwtable, Beta.waves ~Delta.waves, color.palette = terrain.colors)
dev.off()

model.predict = predict(model,test.data)
model.predict

bwtable$predict <- model.predict
bwtable



#######################nonlinear kernel #####################


model = svm(Classification~Delta.waves+Beta.waves,data=training.data)
model
summary(model)


library(ggplot2)

#par(mfrow=c(2,1))

qplot(bwtable[,1] , bwtable[,1], col=  bwtable[,3])
plot(model, bwtable, Delta.waves ~ Beta.waves, color.palette = terrain.colors)

model.predict = predict(model,test.data)
model.predict

bwtable$predict <- model.predict
bwtable

