# Set the Working Directory
filePath<- "./Data"
if(!file.exists("./Data/Plots")){dir.create("./Data/Plots")}

# Load the new power.consumption dataset

power.consumption<-read.table('./Data/power.consumption.csv',
header=TRUE,sep=',',na.strings='?')

#Create and Export the chart to plot1.png

png(filename='./Data/Plots/plot1.png',width=480,height=480,units='px')

hist(as.numeric(power.consumption$Global_active_power),main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')
dev.off()