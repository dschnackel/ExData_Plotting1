

createPlot2 <- function(){
        ##Load Library
        library(data.table)
        ##Read file from local
        DT<-fread("./data/household_power_consumption.txt",sep=";", header = TRUE, na.strings="?", stringsAsFactors=FALSE,colClasses="Character")
        ##Reformat Date 
        DT$Date=as.Date(DT$Date,"%d/%m/%Y")
        ##Subset data for two days only
        dt <- subset(DT,DT$Date>="2007-02-01" & DT$Date <= "2007-02-02")
        ##Create PNG file
        png(file="./figure/plot2.png",width=480,height=480)
        ##Create DAteTime vector
        x<-strptime(paste(as.character(dt$Date),dt$Time),format="%Y-%m-%d %H:%M:%S")
        ##Create plot
        plot(x,as.numeric(dt$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)")        
        ##Close file
        dev.off() 
}