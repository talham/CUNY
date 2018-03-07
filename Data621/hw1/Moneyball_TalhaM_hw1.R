## MoneyBall Assignment Homework 1
#author: "Talha Muhammad"
#library of packages
library(ggplot2)
library(gridExtra)
library(dplyr)
library(tidyr)
library(Hmisc)
library(reshape2)
library(leaps)
library(xtable)
library(VIM)
library(mice)
library(MASS)
options(xtable.floating = FALSE)
options(xtable.timestamp = "")

#set the working directory
setwd("C:/Users/talha/Documents/Training/CUNY Classes/Data 621/hw1")


## 1. Data Exploration (EDA)   

# Describe the size and the variables in the moneyball training data set.
# Consider that too much detail will cause a manager to lose interest while too little detail 
# will make the manager consider that you aren't doing your job. Some suggestions are given below. 
# Please do NOT treat this as a check list of things to do to complete the assignment. You should have 
# your own thoughts on what to tell the boss. These are just ideas.
# a. Mean / Standard Deviation / Median
# b. Bar Chart or Box Plot of the data
# c. Is the data correlated to the target variable (or to other variables?)
# d. Are any of the variables missing and need to be imputed "fixed"?

#read-in the data
mdata<-read.csv("moneyball-training-data.csv")
#str
str(mdata)
#head of the data
head(mdata)
summary(mdata)

# figure definitions 
w<-7
h<-6
pts<-12
rs<-240

#figure plots of histogram and 
p1<-ggplot(mdata, aes(TARGET_WINS))
p1<-p1+geom_histogram(bins=20,alpha=0.5,color="blue", fill="blue")+ggtitle("Histogram of Target Wins")
p2<-ggplot(mdata, aes(TEAM_BATTING_H))
p2<-p2+geom_histogram(bins=20,alpha=0.5,color="darkgreen", fill="darkgreen")
p3<-ggplot(mdata, aes(TEAM_BATTING_2B))
p3<-p3+geom_histogram(bins=20,alpha=0.5,color="darkgreen", fill="darkgreen")
p4<-ggplot(mdata, aes(TEAM_BATTING_H))
p4<-p4+geom_histogram(bins=20,alpha=0.5,color="darkgreen", fill="darkgreen")
p5<-ggplot(mdata, aes(TEAM_BATTING_HR))
p5<-p5+geom_histogram(bins=20,alpha=0.5,color="darkgreen", fill="darkgreen")
p6<-ggplot(mdata, aes(TEAM_BATTING_BB))
p6<-p6+geom_histogram(bins=20,alpha=0.5,color="darkgreen", fill="darkgreen")
p7<-ggplot(mdata, aes(TEAM_BATTING_HBP))
p7<-p7+geom_histogram(bins=20,alpha=0.5,color="darkgreen", fill="darkgreen")
p8<-ggplot(mdata, aes(TEAM_BATTING_SO))
p8<-p8+geom_histogram(bins=20,alpha=0.5,color="darkgreen", fill="darkgreen")
p9<-ggplot(mdata, aes_string(names(mdata)[9]))
p9<-p9+geom_histogram(bins=20,alpha=0.5,color="darkgreen", fill="darkgreen")
p10<-ggplot(mdata, aes_string(names(mdata)[10]))
p10<-p10+geom_histogram(bins=20,alpha=0.5,color="darkgreen", fill="darkgreen")
p11<-ggplot(mdata, aes_string(names(mdata)[11]))
p11<-p11+geom_histogram(bins=20,alpha=0.5,color="darkgreen", fill="darkgreen")
p12<-ggplot(mdata, aes_string(names(mdata)[12]))
p12<-p12+geom_histogram(bins=20,alpha=0.5,color="darkgreen", fill="darkgreen")
p13<-ggplot(mdata, aes_string(names(mdata)[13]))
p13<-p13+geom_histogram(bins=20,alpha=0.5,color="darkgreen", fill="darkgreen")
p14<-ggplot(mdata, aes_string(names(mdata)[14]))
p14<-p14+geom_histogram(bins=20,alpha=0.5,color="darkgreen", fill="darkgreen")
p15<-ggplot(mdata, aes_string(names(mdata)[15]))
p15<-p15+geom_histogram(bins=20,alpha=0.5,color="darkgreen", fill="darkgreen")
p16<-ggplot(mdata, aes_string(names(mdata)[16]))
p16<-p16+geom_histogram(bins=20,alpha=0.5,color="darkgreen", fill="darkgreen")
p17<-ggplot(mdata, aes_string(names(mdata)[17]))
p17<-p17+geom_histogram(bins=20,alpha=0.5,color="darkgreen", fill="darkgreen")

ggsave("hist1.png",p1,width=w,height=h,dpi=rs, units="in")
ggsave("hist2.png",grid.arrange(p2,p3,p4,p5,p6,p7,nrow=2),width=w,height=h,dpi=rs, units="in")
ggsave("hist3.png",grid.arrange(p8,p9,p10,p11,p12,p13,nrow=2),width=w,height=h,dpi=rs, units="in")
ggsave("hist4.png",grid.arrange(p14,p15,p16,p17,nrow=2),width=w,height=h,dpi=rs, units="in")

#develop pair plots to visualize variables
png(filename="fig1.png",units="in", width=w, height=h, pointsize=pts, res=rs)
pairs(mdata[2:7],cex=0.6,cex.labels=0.6,col="blue3", main="Variable Plots vs. Target")
dev.off()
png(filename="fig2.png",units="in", width=w, height=h, pointsize=pts, res=rs)
pairs(mdata[c(2,8:13)],cex=0.6,cex.labels=0.6,col="blue3", main="Variable Plots vs. Target")
dev.off()
png(filename="fig3.png",units="in", width=w, height=h, pointsize=pts, res=rs)
pairs(mdata[c(2,14:17)],cex=0.6,cex.labels=0.6,col="blue3", main="Variable Plots vs. Target")
dev.off()
#develop box plots
png(filename="fig4.png",units="in", width=w, height=h, pointsize=pts, res=rs)
boxplot(mdata[3:7], boxwex=0.7, col="orange", par(cex.axis=0.6), "Box Plot of Variables")
dev.off()
png(filename="fig5.png",units="in", width=w, height=h, pointsize=pts, res=rs)
boxplot(mdata[c(8:11)], boxwex=0.7, col="orange", par(cex.axis=0.7), main="Box Plot of Variables")
dev.off()
png(filename="fig6.png",units="in", width=w, height=h, pointsize=pts, res=rs)
boxplot(mdata[c(12,15)], boxwex=0.7, col="orange", par(cex.axis=0.7), main="Box Plot of Variables")
dev.off()
png(filename="fig7.png",units="in", width=w, height=h, pointsize=pts, res=rs)
boxplot(mdata[c(13:14,16:17)], boxwex=0.7, col="orange", par(cex.axis=0.7), main="Box Plots of Variables")
dev.off()

### 2. Data Preparation    

# Describe how you have transformed the data by changing the original variables or creating new variables.
# If you did transform the data or create new variables, discuss why you did this. Here are some possible transformations.
# a. Fix missing values (maybe with a Mean or Median value)
# b. Create flags to suggest if a variable was missing
# c. Transform data by putting it into buckets
# d. Mathematical transforms such as log or square root (or use Box-Cox)
# e. Combine variables (such as ratios or adding or multiplying) to create new variables

# develop a plot to see the missing data
png(filename="fig8.png",units="in", width=w, height=h, pointsize=pts, res=rs)
mice_plot <- aggr(mdata[2:17], col=c('blue','orange'),
                  numbers=TRUE, sortVars=TRUE,
                  labels=names(mdata[2:17]), cex.axis=.45,cex.numbers=0.7,cex.lab=0.7,
                  gap=1, ylab=c("Missing data","Pattern"))
dev.off()

# simple imputation for variables where missing values are small %
# less than than 10%
median_imp1<-mdata[!is.na(mdata$TEAM_BATTING_SO),] %>% 
  dplyr::select(one_of(c("TEAM_BATTING_SO"))) %>% summarize_each(funs(median))
median_imp2<-mdata[!is.na(mdata$TEAM_PITCHING_SO),] %>% 
  dplyr::select(one_of(c("TEAM_PITCHING_SO"))) %>% summarize_each(funs(median))
median_imp3<-mdata[!is.na(mdata$TEAM_BASERUN_SB),] %>% 
  dplyr::select(one_of(c("TEAM_BASERUN_SB"))) %>% summarize_each(funs(median))
#impute the medians
mdata$tbatso_i<-mdata$TEAM_BATTING_SO
mdata[is.na(mdata$TEAM_BATTING_SO),"tbatso_i"]<-median_imp1
mdata$tpitchso_i<-mdata$TEAM_PITCHING_SO
mdata[is.na(mdata$TEAM_PITCHING_SO),"tpitchso_i"]<-median_imp2
mdata$tbasesb_i<-mdata$TEAM_BASERUN_SB
mdata[is.na(mdata$TEAM_BASERUN_SB),"tbasesb_i"]<-median_imp3
#plot the data to compare distributions
p18<-ggplot(mdata, aes(TEAM_BATTING_SO))
p18<-p18+geom_histogram(bins=20,alpha=0.5,color="darkgreen", fill="darkgreen")
p19<-ggplot(mdata, aes(tbatso_i))
p19<-p19+geom_histogram(bins=20,alpha=0.5,color="darkorange", fill="darkorange")
ggsave("fig12.png",grid.arrange(p18,p19,nrow=1),width=w,height=h,dpi=rs, units="in")
#multiple imputation
set.seed(445)
imp <- mice(mdata[,2:17], m=1, maxit=5, Method = "pmm")
z <- complete(imp, 1)
# multiple imp
#variable 1
png(filename="fig13.png",units="in", width=w, height=h, pointsize=pts, res=rs)
par(mfrow=c(1,2))
truehist(z$TEAM_BATTING_HBP[!is.na(mdata$TEAM_BATTING_HBP)],h=1,xlim=c(25,100),
         col=mdc(1),xlab="Team Batting observed", main="TEAM_BATTING_HBP",prob=FALSE)
truehist(z$TEAM_BATTING_HBP[is.na(mdata$TEAM_BATTING_HBP)],h=1,xlim=c(25,100),
         col=mdc(2),xlab="Team Batting imputed", prob=FALSE)
dev.off()

truehist(z$TEAM_BASERUN_CS[!is.na(mdata$TEAM_BASERUN_CS)],h=1,xlim=c(0,201),
         col=mdc(1),xlab="Team Baserun observed", main="TEAM_BASERUN_CS",prob=FALSE)
truehist(z$TEAM_BASERUN_CS[is.na(mdata$TEAM_BASERUN_CS)],h=1,xlim=c(0,201),
         col=mdc(2),xlab="Team Baserun imputed", prob=FALSE)
truehist(z$TEAM_FIELDING_DP[!is.na(mdata$TEAM_FIELDING_DP)],h=1,xlim=c(0,201),
         col=mdc(1),xlab="Team Baserun observed", main="TEAM_FIELDING_DP",prob=FALSE)
truehist(z$TEAM_FIELDING_DP[is.na(mdata$TEAM_FIELDING_DP)],h=1,xlim=c(0,201),
         col=mdc(2),xlab="Team Baserun imputed", prob=FALSE)
#impute 
mdata$tbathbp_i<-z$TEAM_BATTING_HBP
mdata$tbasecs_i<-z$TEAM_BASERUN_CS
mdata$tfielddp_i<-z$TEAM_FIELDING_DP
#par(oldpar)
par(mfrow=c(1,1))
mdata_sel<-dplyr::select(mdata,-TEAM_BATTING_HBP,-TEAM_BASERUN_CS,-TEAM_FIELDING_DP,-TEAM_BATTING_SO,-TEAM_PITCHING_SO,-TEAM_BASERUN_SB,-INDEX)


### 3. Build Models   

# Using the training data set, build at least three different multiple 
# linear regression models, using different variables (or the same variables with different transformations).
# Since we have not yet covered automated variable selection methods, you should select the variables manually 
#(unless you previously learned Forward or Stepwise selection, etc.). Since you manually selected a variable for 
#inclusion into the model or exclusion into the model, indicate why this was done.
# Discuss the coefficients in the models, do they make sense? For example, if a team hits a lot of Home Runs, 
#it would be reasonably expected that such a team would win more games. However, if the coefficient is negative 
#(suggesting that the team would lose more games), then that needs to be discussed. Are you keeping the model even 
#though it is counter intuitive? Why? The boss needs to know.


# Get upper triangle of the correlation matrix
get_upper_tri <- function(cormat){
  cormat[lower.tri(cormat)]<- NA
  return(cormat)
}

get_tstat<-function(object,num){
  a=diag(vcov(object,num))^0.5
  b=coef(object,num)
  return (b/a)
}


res2<-rcorr(as.matrix(mdata_sel))
##Correlation Plots
res2_corr<-get_upper_tri(res2$r)
res2_p<-get_upper_tri(res2$P)
melted_res2 <- melt(res2_corr, na.rm = TRUE)
melted_res2_p<- melt(res2_p, na.rm = TRUE)



res2_data<-melted_res2 %>% left_join(melted_res2_p,by=c("Var1","Var2")) %>% rename("corr"=value.x,"p_val"=value.y)
res2_data$p_val[is.na(res2_data$p_val)]<-0

cplot1<-ggplot(data = res2_data, aes(Var2, Var1, fill = corr))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson\nCorrelation")+theme(axis.text.x = element_text(angle = 90,vjust = 0.5, 
                                                                                     size = 10, hjust = 1))+coord_fixed()+labs(title="Correlation Plot")

cplot2<-ggplot(data = res2_data, aes(Var2, Var1, fill = p_val))+
  geom_tile(color = "white")+
  scale_fill_gradient(low = "red", high = "yellow", limit = c(0,1), space = "Lab", 
                      name="P-Values")+theme(axis.text.x = element_text(angle = 90,vjust = 0.5, 
                                                                                    size = 10, hjust = 1))+coord_fixed()+labs(title="Correlation P-Values")
ggsave("cplot1.png",cplot1,width=w,height=h,dpi=rs, units="in")
ggsave("cplot2.png",cplot2,width=w,height=h,dpi=rs, units="in")
#grid.arrange(plot1,plot2,ncol=2)

#res2_data<-filter(res2_data,Var1%in%"val_mhz_pops"|Var1%in%"trans"|Var1%in%"ln_val_mhz_pops"|Var1%in%"ln_trans"|Var2%in%"val_mhz_pops"|Var2%in%"trans"|Var2%in%"ln_val_mhz_pops"|Var2%in%"ln_trans")
#res2_data[with(res2_data,order(Var1,-corr,-p_val)),]

regfit=regsubsets(TARGET_WINS~., data=mdata_sel,nvmax=16, method="forward")
sum_reg<-summary(regfit)
png(filename="fig14.png",units="in", width=w, height=h, pointsize=pts, res=rs)
par(mfrow=c(1,3))
plot(sum_reg$adjr2,xlab="Number of Variables",ylab="Adjusted R2",type='b',main="Model Fit", col="red")
plot(sum_reg$cp,xlab="Number of Variables",ylab="Cp",type='b',main="Model Fit", col="grey")
plot(sum_reg$bic,xlab="Number of Variables",ylab="BIC",type='b',main="Model Fit", col="orange")
dev.off()

for(i in 1:12){
print("coefficients")
print(coef(regfit,i))
print("t-stat")
print(get_tstat(regfit,i))
}


### 4. Select Models
# Decide on the criteria for selecting the best multiple linear regression model. Will you select a model with 
#slightly worse performance if it makes more sense or is more parsimonious? Discuss why you selected your model.
# For the multiple linear regression model, will you use a metric such as Adjusted R2, RMSE, etc.? Be sure to explain 
#how you can make inferences from the model, discuss multi-collinearity issues (if any), and discuss other relevant model 
#output. Using the training data set, evaluate the multiple linear regression model based on (a) mean squared error, (b) R2, 
#(c) F-statistic, and (d) residual plots. Make predictions using the evaluation data set.

regfit_s=regsubsets(TARGET_WINS~.-tfielddp_i-tbasecs_i, data=mdata_sel,nvmax=15, method="forward")
sum_reg_alt<-summary(regfit_s)
png(filename="fig15.png",units="in", width=w, height=h, pointsize=pts, res=rs)
par(mfrow=c(1,3))
plot(sum_reg_alt$adjr2,xlab="Number of Variables",ylab="Adjusted R2",type='b',main="Model Fit", col="red")
plot(sum_reg_alt$cp,xlab="Number of Variables",ylab="Cp",type='b',main="Model Fit", col="grey")
plot(sum_reg_alt$bic,xlab="Number of Variables",ylab="BIC",type='b',main="Model Fit", col="orange")
dev.off()

for(i in 1:12){
  print("coefficients")
  print(coef(regfit_s,i))
  print("t-stat")
  print(get_tstat(regfit_s,i))
}

##Model 1
mfit1<-lm(TARGET_WINS~TEAM_BATTING_H+TEAM_FIELDING_E+tbasesb_i+tbathbp_i,data=mdata_sel)
summary(mfit1)
xtable(mfit1)
png(filename="model1.png",units="in", width=w, height=h, pointsize=pts, res=rs)
par(mfrow=c(2,2))
plot(mfit1,col="blue",main="Model 1 Fit")
dev.off()
png(filename="model1_fit.png",units="in", width=w, height=h, pointsize=pts, res=rs)
plot(mfit1$fitted.values,mdata_sel$TARGET_WINS,cex=0.5,col="blue",xlab="Fitted Values", ylab="TARGET_WINS",xlim=c(0,150),ylim=c(0,150))
dev.off()
##Model 2
mfit2<-lm(TARGET_WINS~TEAM_BATTING_H+TEAM_BATTING_3B+TEAM_FIELDING_E+tbasesb_i,data=mdata_sel)
summary(mfit2)
xtable(mfit2)
png(filename="model2.png",units="in", width=w, height=h, pointsize=pts, res=rs)
par(mfrow=c(2,2))
plot(mfit2, col="blue",main="Model 2 Fit")
dev.off()
png(filename="model2_fit.png",units="in", width=w, height=h, pointsize=pts, res=rs)
plot(mfit2$fitted.values,mdata_sel$TARGET_WINS,cex=0.5,col="blue",xlab="Fitted Values", ylab="TARGET_WINS",xlim=c(0,150),ylim=c(0,150))
dev.off()

#### Appendix
##code references
# 1) https://www.analyticsvidhya.com/blog/2016/03/tutorial-powerful-packages-imputing-missing-values/
# 2) Mice Package in R
