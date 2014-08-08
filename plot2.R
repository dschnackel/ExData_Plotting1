

createPlot2 <- function(){
        
        library(data.table)
        DT<-fread("./data/household_power_consumption.txt",sep=";", header = TRUE, na.strings="?", stringsAsFactors=FALSE,colClasses="Character")
        DT$Date=as.Date(DT$Date,"%d/%m/%Y")
        dt <- subset(DT,DT$Date>="2007-02-01" & DT$Date <= "2007-02-02")
        png(file="./figure/plot2.png",width=480,height=480)
        x<-strptime(paste(as.character(dt$Date),dt$Time),format="%Y-%m-%d %H:%M:%S")
        plot(x,as.numeric(dt$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)")        
        dev.off() 
}