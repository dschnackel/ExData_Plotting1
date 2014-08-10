

createPlot3 <- function(){
        ##Load Library
        library(data.table)
        ##Read file from local
        DT<-fread("./data/household_power_consumption.txt",sep=";", header = TRUE, na.strings="?", stringsAsFactors=FALSE,colClasses="Character")
        ##Reformat Date
        DT$Date=as.Date(DT$Date,"%d/%m/%Y")
        ##Subset data to two days only
        dt <- subset(DT,DT$Date>="2007-02-01" & DT$Date <= "2007-02-02")
        ##Create PNG file
        png(file="./figure/plot3.png",width=480,height=480)
        ##Create DateTime vector
        x<-strptime(paste(as.character(dt$Date),dt$Time),format="%Y-%m-%d %H:%M:%S")
        ##Crete blank plot
        plot(x,y,type="n",xlab="",ylab="Energy sub metering")
        #Add data points to the plot
        points(x,dt$Sub_metering_1,type="l")
        points(x,dt$Sub_metering_2,type="l",col="red")
        points(x,dt$Sub_metering_3,type="l",col="blue")
        ##Create legend
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
        ##Close file
        dev.off() 
}