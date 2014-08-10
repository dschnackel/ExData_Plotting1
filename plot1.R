

createPlot1 <- function(){
        ##Load library
        library(data.table)
        ##Read file from local 
        DT<-fread("./data/household_power_consumption.txt",sep=";", header = TRUE, na.strings="?", stringsAsFactors=FALSE,colClasses="Character")
        ##Reformat Date
        DT$Date=as.Date(DT$Date,"%d/%m/%Y")
        ##Subset data for two days only
        dt <- subset(DT,DT$Date>="2007-02-01" & DT$Date <= "2007-02-02")
        ##Create PNG file
        png(file="./figure/plot1.png",width=480,height=480)
        ##Create histogram
        hist(as.numeric(dt$Global_active_power),col="Red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
        ##Close file
        dev.off() 
}