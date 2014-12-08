if(!file.exists("exdata-data-household_power_consumption.zip")) {
  Data <- tempfile()
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",Data)
  data1 <- unzip(Data)
  unlink(Data) }
data <- read.table(data1, header=T, sep=";")
fdata<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")
datetime<-paste(fdata$Date, fdata$Time, format="%d/%m/%Y %H:%M:%S")
DateTime <- as.POSIXct(strptime(datetime,format="%d/%m/%Y %H:%M:%S"))
globalactivepower<-as.numeric(as.character(fdata$Global_active_power))
png(file="plot1.png")
hist(Globalactivepower, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
dev.off()