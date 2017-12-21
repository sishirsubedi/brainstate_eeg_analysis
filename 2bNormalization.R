##########################################################################

##########################################################################

# The main part

# Here we use state_brain to represent a person's state, 1--meditation,

#  2--movie, 3--reading;

# Also use user to idenfity the user name

# Every time before runging the codes, please double check if state_brain 

# value is right and if the user name is right

##########################################################################





state_brain=2

user="Lin"



# read the raw data from a csv file


raw_data=(read.csv('AudreyMeditation.csv', header=T, sep = ","))[,1:8]


# find the maximum value and use it to scale the date to prevent overflow

max_value=max(apply(raw_data, 2, max)) 



################## calculate the average percentage of each band, total of each column out of

################## the total of all the values



average_each_band=apply(raw_data/max_value, 2, sum)

total_each_band=sum(average_each_band)

average_each_band=average_each_band/total_each_band



record_bw=data.frame(t(average_each_band), state_brain, user)

# the following also works, record_bw=data.frame(c(average_each_band, state_brain, user))



write.table( record_bw,file="average_each_band_known_state.txt", append = T,col.names = F)             

rm(list=ls())