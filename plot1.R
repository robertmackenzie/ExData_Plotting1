# Effectively disable scientific notation
options(scipen = 999)

# Load the data
source("./load_data.R")

# Create the plot
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
