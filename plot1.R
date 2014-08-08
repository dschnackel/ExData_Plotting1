

createPlot1 <- function(){
        
        library(data.table)
        DT<-fread("./data/household_power_consumption.txt",sep=";", header = TRUE, na.strings="?", stringsAsFactors=FALSE,colClasses="Character")
        DT$Date=as.Date(DT$Date,"%d/%m/%Y")
        dt <- subset(DT,DT$Date>="2007-02-01" & DT$Date <= "2007-02-02")
        png(file="./figure/plot1.png",width=480,height=480)
        hist(as.numeric(dt$Global_active_power),col="Red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
        dev.off() 
}