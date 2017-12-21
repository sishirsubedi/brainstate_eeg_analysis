bwtable.all <- read.csv("cancer.csv", header = TRUE)#download brain wave data as bwtable
bwtable.all

bwtable <- data.frame(age = bwtable.all[,3], psa = bwtable.all[,7],gle = bwtable.all[,9],
                      classification = bwtable.all[,2])
bwtable


plot(bwtable$age, bwtable$psa)
plot(bwtable$age, bwtable$classification)


training.data = rbind(bwtable[1:300,])
training.data
test.data = rbind(bwtable[301:380,])
test.data


glm.fit=glm(classification~psa+gle,data=training.data,family=binomial)
summary(glm.fit)

model.predict = predict(glm.fit,test.data, type = "response")
model.predict

model.predict.class = rep ("0", 80)
model.predict.class[model.predict>0.5] = "1"
table(test.data[,4], model.predict.class)

mean(model.predict.class != test.data[,4])
