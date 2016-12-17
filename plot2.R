# Set the Working Directory
filePath<- "./Data"
if(!file.exists("./Data/Plots")){dir.create("./Data/Plots")}

# Load the new power.consumption dataset

power.consumption<-read.table('./Data/power.consumption.csv',
header=TRUE,sep=',',na.strings='?')

#Create and Export the chart to plot2.png

png(filename='./Data/Plots/plot2.png',width=480,height=480,units='px')
plot(strptime(power.consumption$datetime, "%d/%m/%Y %H:%M:%S"), as.integer(power.consumption$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

dev.off()