source("getData.R")

plot1 <- function(){
    graph_data <- getData()
    hist(graph_data$Global_active_power, xlab = "Global Active Power (kilowatts)", main="Global Active Power", col="red")
}