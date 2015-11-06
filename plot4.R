source("getData.R")

plot4 <- function(){
    graph_data <- getData()
    # create DateTime column to contain Date + Time as a Date
    graph_data$DateTime <- strptime(paste(graph_data$Date, graph_data$Time), "%d/%m/%Y %H:%M:%S")
    
    par(mfrow = c(2, 2))
    #graph 1
    plot(graph_data$DateTime, graph_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    #graph 2
    plot(graph_data$DateTime, graph_data$Voltage, type="l", xlab="", ylab="Voltage")
    #graph 3
    plot(graph_data$DateTime, graph_data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
    lines(graph_data$DateTime, graph_data$Sub_metering_1)
    lines(graph_data$DateTime, graph_data$Sub_metering_2, col="red")
    lines(graph_data$DateTime, graph_data$Sub_metering_3, col="blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), c("black", "red", "blue"), bty="n")
    #graph 4
    plot(graph_data$DateTime, graph_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
    
}