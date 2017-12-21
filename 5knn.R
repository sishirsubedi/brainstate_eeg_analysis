bwtable.all <- read.csv("bwdata.csv", header = TRUE)#download brain wave data as bwtable
bwtable.all

bwtable <- data.frame(Delta.waves = bwtable.all[,1],Beta.waves = bwtable.all[,4],Classification = bwtable.all[,6])
bwtable



library(class)
training.data = rbind(bwtable[1:14,], bwtable[15:28,])
training.data
test.data = rbind(bwtable[1:14,], bwtable[15:28,])
test.data

# test all sample as test data
bwtable[,1:2]
knn.out <- (knn(training.data[,1:2], bwtable[,1:2], training.data[,3], k = 2)) # k = neighbor 
summary(knn.out)
table(bwtable[,3])
table(bwtable[,3], knn.out)
plot(knn.out)

library(ggplot2)
theme_set(theme_gray(base_size = 25))
library(ggplot2)
#install.packages("gridExtra")
library(gridExtra)
bwtable

theme_set(theme_gray(base_size = 25))
p <- ggplot(bwtable, aes(x=bwtable[,1], y=bwtable[,2]))
p +  geom_point(aes(shape=knn.out, color=Classification, size= 6))+ xlab("Delta Waves")+ylab("Beta Waves")
    
ggsave("Brainwaves_KNN.png")

