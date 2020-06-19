# written by G. Magoga, giulia.magoga@unimi.it


### test statistical significance of microorganisms co-presence in the same host

data=read.csv("example.csv", sep=";") #read data frame

#absence, presence, coocurrence
rs=table(rowSums(data)) # calculate absence, presence, co-presence values from real data 


# create a null model
d1=data.frame(replicate(9999,sample(data[,1]))) #create a distribution permuting 9,999 times presence/absence first column of the dataframe
d2=data.frame(replicate(9999,sample(data[,2]))) #create a distribution permuting 9,999 times presence/absence second column of the dataframe


# Evaluate co-presence in null model 
t=list()

for (i in seq(length(d1))){
 t[[i]]=table(d1[i] + d2[i]) } #register absence, presence, co-presence in pairs of columns from d1 and d2
 
tt=vector()

for (i in seq(length(d1))){
tt[i]=t[[i]][3]} # Extract co-presence from the list of absence, presence, co-presence

tt[is.na(tt)] <- 0 


# Print results
rs # real data absence, presence, co-presence 

table(tt) # null model co-presence 

summary(tt) # statistics on null model co-presence distribution 

quantile(tt, probs = c(0.025, 0.5, 0.975)) # Estimate from null model distribution 2.5 50 and 97.5 percentiles


# Visualize results
hist(tt,labels=T, breaks=max(tt), xlim = range(min(tt),max(tt))) #histogram of co-presence distribution from null model
abline(v=rs[3],lwd=2,col="red") # plot red line for showing real data co-presence value
abline(v=quantile(tt, probs = c(0.025,  0.975)), lwd=2,col="blue", lty=3) # plot blue lines for showing 2.5 and 97.5 percentiles of null distribution



