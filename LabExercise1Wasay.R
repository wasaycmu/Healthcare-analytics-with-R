x=rnorm(10000,mean=10, sd=4)
hist(x,nclass=100)

library(psych)
ToddlerWeight <- read.table("C:/Users/Abdul Wasay/Desktop/ToddlerWeight.csv", header=TRUE, quote="\"",stringsAsFactors = FALSE)
View(ToddlerWeight)
summary(ToddlerWeight)
describe(ToddlerWeight$Weight)
hist(ToddlerWeight$Weight, plot=TRUE)
b<-c(15,20,25,30,35,40,45,50,55)
hist(ToddlerWeight$Weight, b, plot=TRUE)

boxplot(ToddlerWeight$Weight,plot = TRUE)