# Load required libraries
library(dplyr)
library(tidyr)
library(gtools)

# Set the directory containing the CSV files
directory <- "occupancy-data"

# Get a list of all CSV files in the directory
files <- list.files(path = directory, pattern = "\\.csv$", full.names = TRUE)

# Function to read and process each CSV file
process_file <- function(file_path) {
  # Read CSV file
  data <- read.csv(file_path)
  data <- data[data$site != "training", ]
  
  # Summarize presence of 1 in data columns (excluding site and site_id)
  presence_summary <- data %>%
    select(-site, -siteId) %>%
    mutate(presence = if_else(rowSums(., na.rm = TRUE) > 0, 1, 0)) %>%
    pull(presence)
  
  # Get the filename without extension
  filename <- tools::file_path_sans_ext(basename(file_path))
  
  # Combine filename and presence_summary into a single dataframe
  result <- data.frame(site = data$site, siteId = data$siteId, presence_summary)
  colnames(result) <- c("site", "siteId", filename)
  return(result)
}

# Initialize an empty dataframe to store the merged result
merged_result <- NULL

# Loop through each file
for (file_path in files) {
  # Process the file
  result <- process_file(file_path)
  
  # Merge the result with previously processed files based on the "site" column
  if (is.null(merged_result)) {
    merged_result <- result
  } else {
    merged_result <- full_join(merged_result, result, by = c("site", "siteId"))
  }
}

print(merged_result)

