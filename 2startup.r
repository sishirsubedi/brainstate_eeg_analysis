bwtable <- read.csv("bwdata.csv", header = TRUE)#download brain wave data as bwtable2
bwtable



# theta is for drowsy/idle, and beta is for active/working so we are only using theta and beta waves for the analysis
library(ggplot2)


plot(bwtable[,1],bwtable[,4])




#entire box plot

png(filename ="boxplot_allwaves.png")
boxplot(bwtable[,-6], data = bwtable, geom = "boxplot",col=(c("gold","darkgreen","royalblue2", "sienna", "palevioletred1" )),
        cex.axis = 1.5, cex.lab = 1.5 , xlab="Major Brain Waves", ylab = "Normalized Values")
dev.off()

#plot only delta and beta 
library(ggplot2)
#install.packages("gridExtra")
library(gridExtra)
theme_set(theme_gray(base_size = 25))
p <- ggplot(bwtable, aes(x=bwtable[,1], y=bwtable[,4]))
p +  geom_point(aes(color=class, size= 4))+ xlab("Delta Waves")+ylab("Beta Waves")+
  stat_smooth(method="lm", se=TRUE)


  # + theme(legend.position = c(.9, .8)) 
ggsave("DeltaWaves_Betawaves.png")




# plot theta spread
theme_set(theme_gray(base_size = 25))# increase font size to 25
qplot( bwtable[,2], data = bwtable, color=class, geom = "density", xlab ="Delta Waves")
ggsave("DeltaWaves_Density.png")

# plot beta spread
qplot(bwtable[,4], data = bwtable, color=class, geom = "density", xlab ="Beta Waves")
ggsave("BetaWaves_Density.png")


