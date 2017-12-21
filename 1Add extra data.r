getwd()

bwtable.all <- read.csv("bwdata.csv", header = TRUE)#download brain wave data as bwtable
bwtable.all

bwtable <- data.frame(Theta.waves = bwtable.all[,2],Beta.waves = bwtable.all[,4],Classification = bwtable.all[,6])
bwtable

# theta is for drowsy/idle, and beta is for active/working so we are only using theta and beta waves for the analysis
library(ggplot2)

qplot( Theta.waves, Beta.waves,  data = bwtable, color=Classification) #plot only theta and beta 


qplot( Theta.waves, data = bwtable, color=Classification, geom = "density")# plot theta spread


qplot( Beta.waves, data = bwtable, color=Classification, geom = "density")# plot beta spread




###########################end of addtion of extra 36 samples to original 14 samples to make to 50 samples #######################


Theta.waves.max.Idle = max(bwtable[1:14,1])
Theta.waves.max.Idle
Theta.waves.min.Idle = min(bwtable[1:14,1])
Theta.waves.min.Idle

Beta.waves.max.Idle = max(bwtable[1:14,2])
Beta.waves.max.Idle
Beta.waves.min.Idle  = min(bwtable[1:14,2])
Beta.waves.min.Idle

Theta.waves.max.Active = max(bwtable[15:28,1])
Theta.waves.max.Active
Theta.waves.min.Active= min(bwtable[15:28,1])
Theta.waves.min.Active

Beta.waves.max.Active = max(bwtable[15:28,2])
Beta.waves.max.Active 
Beta.waves.min.Active  = min(bwtable[15:28,2])
Beta.waves.min.Active 

Theta.waves.Idle.EXTRA = runif(36, min =Theta.waves.min.Idle, max = Theta.waves.max.Idle)
Theta.waves.Idle.EXTRA 

Beta.waves.EXTRA.Idle = runif(36, min =Beta.waves.min.Idle, max = Beta.waves.max.Idle)
Beta.waves.EXTRA.Idle 

Theta.waves.Active.EXTRA = runif(36, min =Theta.waves.min.Active, max = Theta.waves.max.Active)
Theta.waves.Active.EXTRA 

Beta.waves.EXTRA.Active = runif(36, min =Beta.waves.min.Active, max = Beta.waves.max.Active)
Beta.waves.EXTRA.Active



Theta.waves.ORG.Idle = bwtable[1:14,1]
Theta.waves.ORG.Idle
Theta.waves.ORG.Active = bwtable[15:28,1]
Theta.waves.ORG.Active

Beta.waves.ORG.Idle = bwtable[1:14,2]
Beta.waves.ORG.Idle
Beta.waves.ORG.Active = bwtable[15:28,2]
Beta.waves.ORG.Active


# since append only works with two argument, we have to use sequential append to add all rows together... for .line 71 to 92

Theta.waves.Final = append(Theta.waves.ORG.Idle ,Theta.waves.Idle.EXTRA) # Theta.waves.ORG.Active, Theta.waves.Active.EXTRA )
Theta.waves.Final

Theta.waves.Final = append(Theta.waves.Final,Theta.waves.ORG.Active)# Theta.waves.Active.EXTRA )
Theta.waves.Final

Theta.waves.Final = append(Theta.waves.Final,Theta.waves.Active.EXTRA )
Theta.waves.Final




Beta.waves.Final = append(Beta.waves.ORG.Idle ,Beta.waves.EXTRA.Idle )#  Beta.waves.ORG.Active ,Beta.waves.EXTRA.Active )
Beta.waves.Final

Beta.waves.Final = append(Beta.waves.Final,  Beta.waves.ORG.Active  )
Beta.waves.Final

Beta.waves.Final = append(Beta.waves.Final,  Beta.waves.EXTRA.Active  )
Beta.waves.Final


Idle.class= sample("Idle",50, replace = TRUE)
Idle.class
Active.class= sample("Active",50, replace = TRUE)
Active.class

Class.Final = append (Idle.class , Active.class)
Class.Final

bwtable2 = data.frame(Theta.waves = Theta.waves.Final, Beta.waves = Beta.waves.Final , Classification = Class.Final )
bwtable2


write.table(bwtable2, file ="bwtableadj.csv", sep= ",")

###########################end of addtion of extra 36 samples to original 14 samples to make to 50 samples #######################



