# This is a very basic R script that demonstrates how to read and plot hurricane evacuation order data

install.packages("tidyverse")
install.packages("tigris")
install.packages("ggplot2")
install.packages("readr")
library("tidyverse")
library("tigris")
library("ggplot2")
library("readr")

indir <- "/Users/andrea/Documents/NCAR/AandA/2022_ian/data/evacs/Evacuations_Ian_2022_mandatory.csv"
evacs <- read_csv(indir)

# Use the tigris package to get county polygons
cty <- counties(state = "FL")

# Make sure formats of join variable (FIPS) are the same
evacs$FIPS <- as.character(evacs$FIPS)
cty$GEOID <- as.character(cty$GEOID)

# Add information from tigris county data frame to evacuations data frame
evac_geom <- dplyr::left_join(evacs, cty, by = c("FIPS" = "GEOID"))

# Plot counties that were under an evacuation order in red
ggplot() +
  geom_sf(data = cty, aes(geometry = geometry)) +
  geom_sf(data = evac_geom, aes(geometry = geometry), fill = "red") +
  ggtitle("FL counties under an evacuation order, in red")

# Find counties that were under an evacuation order by midnight on 9/26/22 EDT
test_time = 202209270400  # EDT = UTC + 4hrs
early_evac <- subset(evac_geom, `START TIME, UTC` < test_time)

# Plot counties that were under an evacuation order in red and overlay those 
# under an evacuation order by midnight on 9/26/22 EDT in blue
ggplot() +
  geom_sf(data = cty, aes(geometry = geometry)) +
  geom_sf(data = evac_geom, aes(geometry = geometry), fill = "red") +
  geom_sf(data = early_evac, aes(geometry = geometry), fill = "blue") +
  ggtitle("FL counties under an evacuation order before (blue) and after (red) 9/26/22 EDT")
