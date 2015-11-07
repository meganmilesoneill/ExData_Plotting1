source("getData.R")

plot1 <- function(){
    png(file = "plot1.png") # set device to png file
    graph_data <- getData() # function for downloading and subsetting data is in getData.R
    hist(graph_data$Global_active_power, xlab = "Global Active Power (kilowatts)", main="Global Active Power", col="red")
    dev.off() # close png file devide
}