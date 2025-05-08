install.packages("psych")
install.packages("nloptr")
library(psych)
library(car)
HospitalCost1 <- read.csv("HospitalCost.csv", stringsAsFactors=FALSE)
# --------Check 1 for linearity and multicollinearity-----------------
#Examine the pairs 
pairs(HospitalCost1)
cor(HospitalCost1)
# Build linear model with all variables
RegressedCost1<- lm(Cost ~ Size+Visibility+Admissions, data=HospitalCost1) 
summary(RegressedCost1)
step(RegressedCost1, direction="backward")

# ---------Remove the redundant variable -----------------------------
#Remove the 4th Column (Admissions)
HospitalCost=HospitalCost1[-4]
pairs(HospitalCost)
cor(HospitalCost)

# Build linear model without Admissions
RegressedCost<- lm(Cost ~ Size+Visibility, data=HospitalCost) 
summary(RegressedCost)

#Compare the R-sq of the two models and explain
#Quick and Dirty - Select the variable with the highest p-value for possible elimination

#-------------Use Stepwise Regression to check which model is good--------------------
step(RegressedCost1, direction="backward") 
#Quick and Dirty - Choose the model with lower AIC value --------------------------

# -------------------------------------------------------------------
res = resid(RegressedCost) #get the residues
res  #display the residuals
summary(res)
plot(RegressedCost, which=1) #check the plot for constant variance
summary(lm(abs(res)~fitted(RegressedCost))) #dirty test for a linear relationship
# -------------------------------------------------------------------
plot(RegressedCost,which=2) #check normal plot
shapiro.test(res) #do a test for normality
# -------------------------------------------------------------------
durbinWatsonTest(RegressedCost)
# -------------------------------------------------------------------
#predicting new values
newdata=data.frame(Size=410,Visibility=20)
predict(RegressedCost,newdata)
#Or you can determine the cost directly using the regression equation
4240.131-3.762*410-29.896*20


