# Load the Required Packages

require(dplyr)

# Set the Working Directory and Download the Data

filePath<- getwd()
if(!file.exists("./Data")){dir.create("./Data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
download.file(fileUrl, destfile = "./DataSet.zip")

#Unzip DataSet to ./Data directory

unzip(zipfile ="./DataSet.zip", exdir="./Data")

# Load Date into R

variable.class<-c(rep('character',2),rep('numeric',7))
power.consumption<-read.table('./Data/household_power_consumption.txt',
header=TRUE,sep=';',na.strings='?',colClasses=variable.class)

# Reorgnize and select subset of power.consumption for the first two days of Feb-2007
subset.power.consumption <- mutate(power.consumption, datetime = paste(Date,Time))%>%
filter(Date == '1/2/2007' | Date == '2/2/2007')%>%
select(1,2,10,3:9)%>%
arrange(datetime)

# Expoet the dateset to a new csv file

write.csv(subset.power.consumption, file = "./Data/power.consumption.csv",row.names=FALSE)