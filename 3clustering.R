getwd()

bwtable.all <- read.csv("bwdata.csv", header = TRUE)#download brain wave data as bwtable
bwtable.all

bwtable <- data.frame(Delta.waves = bwtable.all[,1],Beta.waves = bwtable.all[,4],Classification = bwtable.all[,6])
bwtable

# theta is for drowsy/idle, and beta is for active/working so we are only using theta and beta waves for the analysis
library(ggplot2)

qplot( Delta.waves, Beta.waves,  data = bwtable, color=Classification) #plot only delta and beta 


qplot( Delta.waves, data = bwtable, color=Classification, geom = "density")# plot delta spread


qplot( Beta.waves, data = bwtable, color=Classification, geom = "density")# plot beta spread



###########################clustering K means algorithm #######################################

# assign new table with only theta and beta values:

library(class)
km.out = kmeans (bwtable[,1:2], 2, nstart = 28)
km.out

table(bwtable$Classification, km.out$cluster)

bwtable$class = km.out$cluster
bwtable
qplot(Delta.waves, Beta.waves,  data = bwtable, col = class)
ggsave("Brainwaves_kmeans.png")





########heirarchial clustering ###############

d <- dist(as.matrix(bwtable[,1:2]))   # find distance matrix 
hc.complete <- hclust(d, method="complete")                # apply hirarchical clustering 
png("Brainwave_Hclustering.png")
plot(hc.complete, col=bwtable[,3])
dev.off()


d <- dist(as.matrix(bwtable2))   # find distance matrix 
hc.single <- hclust(d, method="single")                # single is shortest distance
plot(hc.single, col=bwtable$Classification)


d <- dist(as.matrix(bwtable2))   # find distance matrix 
hc.average <- hclust(d, method="average")                # average values between cluster
plot(hc.average, col=bwtable$Classification)


hc.cut = cutree(hc.complete, 2)
table(bwtable$Classification, hc.cut)

###########################end of clustering K means algorithm #######################################


