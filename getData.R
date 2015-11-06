require(data.table)
## getData downloads the Household Power Consumption data and writes
##  a smaller subset containing data for 1/2/2007 & 2/2/2007 to a new csv.
## Before downloading and creating the subset, it checks to see if the subset file
##  already exists.
getData <- function(){
    # download data and create subset file if it does not exist.
    if(!file.exists("household_power_consumption_0207.csv")){
        # load zip file into memory.
        message("downloading 'household_power_consumption.zip' data file...")
        temp <- tempfile()
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
        
        # unzip temp file to current directory
        message("unzipping 'household_power_consumption.zip' data file...")
        unzip(temp)
        #release temp file
        unlink(temp)
        
        message("data download complete!")
        
        # load data into a data.table and save filtered subset to file.
        power_dat <- fread(filename, sep=";", na.strings="?")
        message("data loaded!")
        power_dat_0207 <- power_dat[power_dat$Date %in% c("1/2/2007", "2/2/2007"),]
        write.table(power_dat_0207, "household_power_consumption_0207.csv", sep=";")
        message("data saved!")
    }
    # load the subset file into a dataframe and return
    graph_data <- read.csv("household_power_consumption_0207.csv", sep=";")
    graph_data
}