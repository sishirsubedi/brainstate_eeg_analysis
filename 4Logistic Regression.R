bwtable.all <- read.csv("bwdata.csv", header = TRUE)#download brain wave data as bwtable
bwtable.all


#this is to change to 0 and 1 for idle and active 
classn <-c(NULL)
num <- 1
while (num< 29){
  if(bwtable.all[num,6] == "Idle"){
    temp = 0
    classn <- append (classn,temp)
  }else{
    temp = 1
    classn <- append (classn,temp)
  }
  num <- num + 1
}

classn
bwtable <- data.frame(Theta.waves = bwtable.all[,2], Beta.waves = bwtable.all[,4],
                      Classification = classn)
bwtable
###########################################################################################



bwtable <- data.frame(Delta.waves = bwtable.all[,1], Beta.waves = bwtable.all[,4],
                      Classification = bwtable.all[,6])
bwtable
library(ggplot2)

qplot( bwtable[,1],bwtable[,2],  data = bwtable, color=Classification, xlab ="Theta Waves",ylab ="Beta Waves") 
ggsave("ThetaWaves_Betawaves.png")

class(bwtable.all)
mode(bwtable.all)
cor(bwtable.all[,-6])

cor(bwtable[,-3])# check the corelation
pairs(bwtable[,-3])# graph the correlation , here we can see that the correlation is -0.63, which is 
                                                                        # not good 
#separate data into training and test

#########1:10 - train , and 11-14 test :

training.data = rbind(bwtable[1:10,], bwtable[15:24,])
training.data
test.data = rbind(bwtable[11:14,], bwtable[25:28,])
test.data


glm.fit=glm(Classification~Theta.waves+Beta.waves,data=training.data,family=binomial)
summary(glm.fit)
#plot(glm.fit)

model.predict = predict(glm.fit,test.data, type = "response")
model.predict

plot(Classification~Theta.waves+Beta.waves,data=test.data)



#########5-14 - train , and 1-4 test :
training.data = rbind(bwtable[5:14,], bwtable[19:24,])
training.data
test.data = rbind(bwtable[1:4,], bwtable[15:18,])
test.data


glm.fit=glm(Classification~Theta.waves+Beta.waves,data=training.data,family=binomial)
summary(glm.fit)
#plot(glm.fit)

model.predict = predict(glm.fit,test.data, type = "response")
model.predict



############train all, and test alll.....-->
training.data = rbind(bwtable[1:14,], bwtable[15:28,])
training.data
test.data = rbind(bwtable[1:14,], bwtable[15:28,])
test.data


glm.fit=glm(Classification~Delta.waves+Beta.waves,data=training.data,family=binomial)
summary(glm.fit)



###explanation of results::
# since p value is 0.9, 0.2 and 0.1, which is higher, there is no significant relation 
#between classification and delta and beta waves.

#plot(glm.fit)

model.predict = predict(glm.fit,test.data, type = "response")
model.predict
bwtable$predict <- model.predict
bwtable # now this table has all predicted values for each data point

#############################

model.predict.class = model.predict >0.5
model.predict.class
table(test.data[,3], model.predict.class)

library(ggplot2)
ggplot(bwtable, aes(x=Theta.waves, y=Classification)) + geom_point() 
 


# so the summary is there is no significant relationship among classificaion and delta/beta waves.

