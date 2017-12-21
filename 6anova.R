bwtable.all <- read.csv("bwdata.csv", header = TRUE)#download brain wave data as bwtable
bwtable.all

bwtable <- data.frame(Theta.waves = bwtable.all[,2],Beta.waves = bwtable.all[,4],Classification = bwtable.all[,6])
bwtable


# since we want to check if variablity within each state is different than between states
bwtable.idle <- data.frame(Delta.Idle = bwtable.all[1:14,1],Theta.Idle = bwtable.all[1:14,2], Alpha.Idle = bwtable.all[1:14,3],Beta.Idle = bwtable.all[1:14,4],Gamma.Idle = bwtable.all[1:14,5])
bwtable.idle
bwtable.active <- data.frame(Delta.Active = bwtable.all[15:28,1],Theta.Active = bwtable.all[15:28,2], Alpha.Active = bwtable.all[15:28,3],Beta.Active = bwtable.all[15:28,4], Gamma.Active = bwtable.all[15:28,5])
bwtable.active


# to plot in a separate window with two graphs on it 
windows(7,4)
par(mfrow=c(2,1))
boxplot(bwtable.idle)
boxplot(bwtable.active)


#############anova analysis
#null hypothesis is there is no difference in data between active and idle state
anova.theta <- aov (bwtable$Theta.waves~ bwtable$Classification)
summary(anova.theta)
qf(.95, df1=1, df2=26)# now calculate critical value when 95 % confidence 
# so the result show that there is no rejection for null hypothesis
# the value of F is in non rejection region
# that is there is no difference of means 
#between theta waves data between active and idle
#this is end of analysis
TukeyHSD(anova.theta)


anova.beta <- aov (bwtable$Beta.waves~ bwtable$Classification)
summary(anova.beta)
# here we do reject null hypothesis as value of F is in rejection region, 
# there is difference of means in active and idle stae for beta waves
# so we run tukeyHSD to ask where is the difference 
TukeyHSD(anova.beta)
# as here we can see there is difference between active and idle means