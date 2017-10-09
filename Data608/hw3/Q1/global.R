#load the data
#Question 1
#As a researcher, you frequently compare mortality rates from particular causes across
#different States. You need a visualization that will let you see (for 2010 only) the crude
#mortality rate, across all States, from one cause (for example, Neoplasms, which are
#effectively cancers). Create a visualization that allows you to rank States by crude mortality
#for each cause of death.
library(RCurl)
cdc_data<-read.csv(text=getURL("https://raw.githubusercontent.com/charleyferrari/CUNY_DATA608/master/lecture3/data/cleaned-cdc-mortality-1999-2010-2.csv"),header=TRUE,sep=",")
cdc_data$State<-as.factor(cdc_data$State)
cdc_data$ICD.Chapter<-as.character(cdc_data$ICD.Chapter)
colors = c("#F1EEF6", "#D4B9DA", "#C994C7", "#DF65B0", "#DD1C77", "#980043","red3")
cdc_data$colorBuckets <- as.numeric(cut(cdc_data$Crude.Rate, c(4.6,24,50.5,67.3,192.6,249.7,478.4)))
leg.txt <- c("<4.6", ">4.6,<24", ">24,<50.5", "<50.5,<67.3", "<67.3,<192.6", "<192.6,<249.7","<249.7,<478.4")