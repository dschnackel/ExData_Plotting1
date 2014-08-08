

createPlot4<- function(){
        windows(width=480,height=480)
        par(mfcol=c(2,2),mar=c(4,4,4,2))
        library(data.table)
        DT<-fread("./data/household_power_consumption.txt",sep=";", header = TRUE, na.strings="?", stringsAsFactors=FALSE,colClasses="Character")
        DT$Date=as.Date(DT$Date,"%d/%m/%Y")
        dt <- subset(DT,DT$Date>="2007-02-01" & DT$Date <= "2007-02-02")
        x<-strptime(paste(as.character(dt$Date),dt$Time),format="%Y-%m-%d %H:%M:%S")
        ##png(file="./figure/plot4.png",width=480,height=480)
        plot(x,as.numeric(dt$Global_active_power),type="l",xlab="",ylab="Global Active Power")        
        plot(x,dt$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
        points(x,dt$Sub_metering_1,type="l")
        par(mar=c(4,4,4,1))
        points(x,dt$Sub_metering_2,type="l",col="red")
        par(mar=c(4,4,4,2))
        points(x,dt$Sub_metering_3,type="l",col="blue")
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n",xjust=0,cex=.9)
        plot(x,as.numeric(dt$Voltage),type="l",xlab="datetime",ylab="Voltage")        
        plot(x,as.numeric(dt$Global_reactive_power),type="l",xlab="datetime",ylab="Global_reactive_power")    
        dev.copy(png,file="./figure/plot4.png",width=480,height=480)
        dev.off()
        
}
