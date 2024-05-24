# Effectively disable scientific notation
options(scipen = 999)

# Load the data
source("./load_data.R")

# Create the plot
png(
  filename = "plot3.png",
  width = 480,
  height = 480,
  units = "px",
  pointsize = 12
)
plot.new()
with(consumption, {
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
    lty = 1
  )
})
dev.off()
