

createPlot4<- function(){
        
        ##Create windows device of correct size
        windows(width=480,height=480)
        ##Assign Column and Margin values
        par(mfcol=c(2,2),mar=c(4,4,4,2))
        ##Load Library
        library(data.table)
        ##Read from local
        DT<-fread("./data/household_power_consumption.txt",sep=";", header = TRUE, na.strings="?", stringsAsFactors=FALSE,colClasses="Character")
        ##Reformat Date
        DT$Date=as.Date(DT$Date,"%d/%m/%Y")
        ##Subset data for two days only
        dt <- subset(DT,DT$Date>="2007-02-01" & DT$Date <= "2007-02-02")
        ##Create DateTime Vector
        x<-strptime(paste(as.character(dt$Date),dt$Time),format="%Y-%m-%d %H:%M:%S")
        ##Create Plot 1
        plot(x,as.numeric(dt$Global_active_power),type="l",xlab="",ylab="Global Active Power")        
        ##Create blank Plot 2
        plot(x,dt$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
        ##Create Plot 2.1
        points(x,dt$Sub_metering_1,type="l")
        ##Set margins for plot 2.2
        par(mar=c(4,4,4,1))
        ##Create plot2.2
        points(x,dt$Sub_metering_2,type="l",col="red")
        ##Set margins for plot 2.3
        par(mar=c(4,4,4,2))
        ##Create plot 2.3
        points(x,dt$Sub_metering_3,type="l",col="blue")
        ##Create Legend for plot 2.3
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n",xjust=0,cex=.9)
        ##Create plot 3
        plot(x,as.numeric(dt$Voltage),type="l",xlab="datetime",ylab="Voltage")        
        ##Create plot 4
        plot(x,as.numeric(dt$Global_reactive_power),type="l",xlab="datetime",ylab="Global_reactive_power")    
        ##Copy plots to PNG device file
        dev.copy(png,file="./figure/plot4.png",width=480,height=480)
        ##Close PNG file
        dev.off()
        
}
