# Set the Working Directory
filePath<- "./Data"
if(!file.exists("./Data/Plots")){dir.create("./Data/Plots")}

# Load the new power.consumption dataset

power.consumption<-read.table('./Data/power.consumption.csv',header=TRUE,sep=',',na.strings='?')

#Create and Export the chart to plot3.png



png(filename='./Data/Plots/plot3.png',width=480,height=480,units='px')

plot(strptime(power.consumption$datetime, "%d/%m/%Y %H:%M:%S"), as.numeric(power.consumption$Sub_metering_1), type = "l",ylab="Energy Submetering", xlab="")

lines(strptime(power.consumption$datetime, "%d/%m/%Y %H:%M:%S"), as.numeric(power.consumption$Sub_metering_2), type = "l",col="red")

lines(strptime(power.consumption$datetime, "%d/%m/%Y %H:%M:%S"), as.numeric(power.consumption$Sub_metering_3), type = "l",col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


dev.off()