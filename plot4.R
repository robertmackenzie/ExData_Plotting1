# Effectively disable scientific notation
options(scipen = 999)

# Load the data
source("./load_data.R")

# Create the plot
png(
  filename = "plot4.png",
  width = 480,
  height = 480,
  units = "px",
  pointsize = 12
)
plot.new()
par(mfcol = c(2,2))
with(consumption, {
  plot(
    ymd_hms(paste(consumption$Date, consumption$Time)),
    Global_active_power,
    type = "l",
    ylab = "Global Active Power",
    xlab = ""
  )
  plot(
    ymd_hms(paste(consumption$Date, consumption$Time)),
    Sub_metering_1,
    type = "l",
    ylab = "Energy sub metering",
    xlab = ""
  )
  points(
    ymd_hms(paste(consumption$Date, consumption$Time)),
    Sub_metering_2,
    type = "l",
    col = "red"
  )
  points(
    ymd_hms(paste(consumption$Date, consumption$Time)),
    Sub_metering_3,
    type = "l",
    col = "blue"
  )
  legend(
    "topright",
    names(consumption)[7:9],
    col = c("black", "red", "blue"),
    lty = 1,
    bty = "n"
  )
  plot(
    ymd_hms(paste(consumption$Date, consumption$Time)),
    Voltage,
    type = "l",
    xlab = "datetime"
  )
  plot(
    ymd_hms(paste(consumption$Date, consumption$Time)),
    Global_reactive_power,
    type = "l",
    xlab = "datetime"
  )
})
dev.off()
