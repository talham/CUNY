##reference for conversion
##https://blog.exploratory.io/creating-geojson-out-of-shapefile-in-r-40bc0005857d
library(rgdal)
library(spdplyr)
library(geojsonio)
library(rmapshaper)
library(dplyr)
library(tidyr)
library(sf)

setwd("C:/Users/talha/Documents/Training/Datasets/Transportation/NHTS")
#read in the file
#msa shapefiles
cbsa13 <- readOGR(dsn = "shapefiles/cb_2013_us_cbsa_5m",layer = "cb_2013_us_cbsa_5m", verbose = FALSE)
#state level shapefiles
cb_states<-readOGR(dsn="C:/Users/talha/Documents/GIS DataBase/States/cb_2016_us_state_500k", layer="cb_2016_us_state_500k",verbose=FALSE)
#difference files
cb_state_diff<-readOGR(dsn="C:/Users/talha/Documents/GIS DataBase/States/MSA_16_State_difference", layer="MSA_state_difference",verbose=FALSE)
cb_nation<-readOGR(dsn = "shapefiles/cb_2016_us_nation_20m",layer = "cb_2016_us_nation_20m", verbose = FALSE)

#show the files
cbsa13
cb_states
cb_nation
#convert errors
cbsa13$NAME<-as.character(cbsa13$NAME)
cbsa13$NAME[cbsa13$GEOID==32420]<-"Mayaguez, PR"
cbsa13$NAME[cbsa13$GEOID==41900]<-"San German, PR"
cbsa13$NAME[cbsa13$GEOID==15860]<-"Canon City, CO"
cbsa13$NAME[cbsa13$GEOID==21580]<-"Espanola, NM"

#convert to geo_json
cb_states_json<-geojson_json(cb_states)
cbsa13_json <- geojson_json(cbsa13)
cbsa13_json<-ms_simplify(cbsa13_json)
cb_nation_json<-geojson_json(cb_nation)
cb_state_diff_json<-geojson_json(cb_state_diff)
cb_state_diff_json<-ms_simplify(cb_state_diff_json)
geojson_write(cbsa13_json,file="shapefiles/cbsa13.geojson",overwrite=TRUE)
geojson_write(cb_states_json,file="shapefiles/cb_states_json.geojson",overwrite=TRUE)
geojson_write(cb_nation_json,file="shapefiles/cb_nation.json",overwrite=TRUE) 

############################################################
############################################################
###### Analysis of the data
vehdata<-read.csv("C:/Users/talha/Documents/Training/Datasets/Transportation/NHTS/Ascii/VEHV2PUB.CSV")
#vehicle data from the survey. By household and vehicle. Unique identifier
#is household + vehicle id
cen10data<-read.csv("C:/Users/talha/Documents/Training/Datasets/Transportation/NHTS/cen10pub/cen10pub.csv")
# 2010 census boundaries for the survey. Household Id's are unique
#merge the data 2010 census boundaries with vehicle data
vehdata_cen10<-merge(vehdata,cen10data, by=("HOUSEID"),all.x=TRUE)
#calculate vehicle age by census area 
vehdata_cen10<-vehdata_cen10 %>% mutate(w_age=VEHAGE*WTHHFIN)
vehage<-vehdata_cen10 %>% filter(VEHAGE!=-9) %>% group_by(HH_CBSA10) %>% summarize(tot_w_age=sum(w_age),tot_w=sum(WTHHFIN))
vehage<-vehage %>% mutate(avg_age=round(tot_w_age/tot_w,2))
vehage_s<-vehage  %>% filter(HH_CBSA10!=-1&HH_CBSA10!=-9&HH_CBSA10!='XXXXX')
#calculate age for rural areas i.e. HH_CBSA10==-1
vehage_st<-vehdata_cen10 %>% filter(VEHAGE!=-9&HH_CBSA10==-1) %>% group_by(HHSTFIPS) %>% summarize(tot_w_age=sum(w_age),tot_w=sum(WTHHFIN))
vehage_st<-vehage_st %>% mutate(avg_age=round(tot_w_age/tot_w,2))
#convert the FiPS State into character
vehage_st$HHSTFIPS<-as.character(vehage_st$HHSTFIPS)
vehage_st[vehage_st$HHSTFIPS==1,1]<-"01"
vehage_st[vehage_st$HHSTFIPS==2,1]<-"02"
vehage_st[vehage_st$HHSTFIPS==4,1]<-"04"
vehage_st[vehage_st$HHSTFIPS==5,1]<-"05"
vehage_st[vehage_st$HHSTFIPS==6,1]<-"06"
vehage_st[vehage_st$HHSTFIPS==8,1]<-"08"
write.csv(vehage_s,"C:/Users/talha/Documents/Training/CUNY Classes/IS608/Final_Project/Analysis/vehicle_age.csv")
write.csv(vehage_st,"C:/Users/talha/Documents/Training/CUNY Classes/IS608/Final_Project/Analysis/vehicle_age_rural.csv")
#calculate Average Annual Miles


