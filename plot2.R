# Effectively disable scientific notation
options(scipen = 999)

# Load the data
source("./load_data.R")

# Create the plot
png(
  filename = "plot2.png",
  width = 480,
  height = 480,
  units = "px",
  pointsize = 12
)
with(consumption, plot(
  ymd_hms(paste(consumption$Date, consumption$Time)),
  Global_active_power,
  type = "l",
  ylab = "Global Active Power (kilowatts)",
  xlab = ""
))
dev.off()
