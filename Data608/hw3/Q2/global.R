#Question 2:
#Often you are asked whether particular States are improving their mortality rates (per cause)
#faster than, or slower than, the national average. Create a visualization that lets your clients
#see this for themselves for one cause of death at the time. Keep in mind that the national
#average should be weighted by the national population.
library(RCurl)
cdc_data<-read.csv(text=getURL("https://raw.githubusercontent.com/charleyferrari/CUNY_DATA608/master/lecture3/data/cleaned-cdc-mortality-1999-2010-2.csv"),header=TRUE,sep=",")
cdc_data$State<-as.character(cdc_data$State)
cdc_data$ICD.Chapter<-as.character(cdc_data$ICD.Chapter)
