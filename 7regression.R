movie <- read.csv("movie.csv", header = TRUE)#download brain wave data as bwtable
movie
#here boxoffice is dependent and cost, promotion, and bookgame is independent
#run dependent variable vs ind. variable to see if there is pattern
library(ggplot2)
qplot(cost , boxoffice , data= movie)
qplot(promotion ,boxoffice , data= movie)
qplot(bookgame , boxoffice, data= movie )

# looks like box office increases with cost, promotion but may be not with bookgame

#now check corelation between each independ.variables
qplot(cost , promotion , data= movie)
qplot(cost ,bookgame , data= movie)
qplot(bookgame , promotion, data= movie )

# check with correlation values

cor(movie)

# here we can see that cost and promotion are correlated, but not bookgame

#individual regression- that means boxoffive vs all others

box.cost <- lm(boxoffice~cost, data = movie)
summary(box.cost)

box.promotion <- lm(boxoffice~promotion, data = movie)
summary(box.promotion)

box.bookgame <- lm(boxoffice~bookgame, data = movie)
summary(box.bookgame)


box.all <- lm(boxoffice~cost+promotion+bookgame, data = movie)
summary(box.all)


#box vs cost = Adjusted R-squared:  0.8219 
#box vs promotion = Adjusted R-squared:  0.8479 
#box vs bookgame = Adjusted R-squared:  0.1285
# box vs all = Adjusted R-squared:  0.9502


#here we will run regression line on each pair
plot(movie$cost ,movie$boxoffice)
abline(box.cost)
plot(movie$promotion ,movie$boxoffice)
abline(box.promotion)
plot(movie$bookgame ,movie$boxoffice)
abline(box.bookgame)

##--thus, best regression is for boxoffice vs all
# which is given by ---> 
#boxoffice = 3.6616cost + 7.6211 promotion + 0.8285 bookgame 

# test the regression prediction and errors

boxoffice.regression <- c(NULL)
counter <- 1
while(counter <11) {
  temp <-  3.6616 * movie[counter,2] + 7.6211 * movie[counter,3] + 0.8285 *  movie[counter,4]
  boxoffice.regression <- append(boxoffice.regression, temp)
  counter <- counter + 1
}
boxoffice.regression

movie$Regression <- boxoffice.regression
movie

error <- movie$boxoffice - movie$Regression
error

movie$error <- error
movie 

# thus we now have the complete movie table with regression prediction and error
