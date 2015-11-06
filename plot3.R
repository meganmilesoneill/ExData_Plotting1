source("getData.R")

plot3 <- function(){
    png(file = "plot3.png") # set device to png file
    graph_data <- getData()
    # create DateTime column to contain Date + Time as a Date
    graph_data$DateTime <- strptime(paste(graph_data$Date, graph_data$Time), "%d/%m/%Y %H:%M:%S")
    plot(graph_data$DateTime, graph_data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
    lines(graph_data$DateTime, graph_data$Sub_metering_1)
    lines(graph_data$DateTime, graph_data$Sub_metering_2, col="red")
    lines(graph_data$DateTime, graph_data$Sub_metering_3, col="blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), c("black", "red", "blue"))
    dev.off() # close png file devide
}