

createPlot3 <- function(){
        
        library(data.table)
        DT<-fread("./data/household_power_consumption.txt",sep=";", header = TRUE, na.strings="?", stringsAsFactors=FALSE,colClasses="Character")
        DT$Date=as.Date(DT$Date,"%d/%m/%Y")
        dt <- subset(DT,DT$Date>="2007-02-01" & DT$Date <= "2007-02-02")
        png(file="./figure/plot3.png",width=480,height=480)
        x<-strptime(paste(as.character(dt$Date),dt$Time),format="%Y-%m-%d %H:%M:%S")
        plot(x,y,type="n",xlab="",ylab="Energy sub metering")
        points(x,dt$Sub_metering_1,type="l")
        points(x,dt$Sub_metering_2,type="l",col="red")
        points(x,dt$Sub_metering_3,type="l",col="blue")
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
        dev.off() 
}