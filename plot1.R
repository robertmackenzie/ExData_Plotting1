library(readr)
library(dplyr)
library(lubridate)

# Effectively disable scientific notation
options(scipen = 999)

zip_file_name <- "household_power_consumption.zip"
file_name <- "household_power_consumption.txt"
status <- download.file(
  "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
  destfile = zip_file_name
)
if (status != 0) {
  stop(sprintf("Cannot download file %s", zip_file_name))
}
unzip(zip_file_name, files = file_name)

consumption <- read_delim(
  file_name,
  delim = ";",
  na = c("?", ""),
  col_types = cols(
    Date = col_date(format = "%d/%m/%Y"),
    Time = col_time(format = ""),
    Global_active_power = col_double(),
    Global_reactive_power = col_double(),
    Voltage = col_double(),
    Global_intensity = col_double(),
    Sub_metering_1 = col_double(),
    Sub_metering_2 = col_double(),
    Sub_metering_3 = col_double()
  )
) %>% filter(between(Date, ymd("2007-02-01"), ymd("2007-02-02")))

stop_for_problems(consumption)

png(
  filename = "plot1.png",
  width = 480,
  height = 480,
  units = "px",
  pointsize = 12
)
with(consumption, hist(
                    Global_active_power,
                    main = "Global Active Power",
                    xlab = "Global Active Power (kilowatts)",
                    col = "red"))
dev.off()
