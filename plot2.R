source("getData.R")

plot2 <- function(){
    png(file = "plot2.png") # set device to png file
    graph_data <- getData() # function for downloading and subsetting data is in getData.R
    # create DateTime column to contain Date + Time as a Date
    graph_data$DateTime <- strptime(paste(graph_data$Date, graph_data$Time), "%d/%m/%Y %H:%M:%S")
    plot(graph_data$DateTime, graph_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    dev.off() # close png file devide
}