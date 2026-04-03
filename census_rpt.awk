#!/usr/bin/awk -f
# Author: Aiden Cary
# Date: April 06, 2026
# Assignment 7: AWK Scripting
BEGIN {
    # Delimiter is a tab
    FS = "\t"
    # Set constant min and max values for comparison
    max_pop_density = -1
    min_pop_density = 1000000000
    max_percent_of_water = -1
    min_percent_of_water = 1000000000
    # Print the header for the report
    printf "%-20s %15s %15s\n", "County", "Pop/Sq Mile", "% Water"
    # Print a line of dashes to separate the header from the data
    printf "%-20s %15s %15s\n", "------------", "------------", "------------"
}
{
    # Calculate the pop density (num of people / landarea)
    pop_density = $2 / $4
    # Calculate the percent of water ((water / (water + land)) * 100)
    percent_of_water = (($3 / ($3 + $4)) * 100)
    # Print the report line 
    #(with a precision of 6 for the pop density and percent of water)
    printf "%-20s %15.6f %15.6f\n", $1, pop_density, percent_of_water

    # Keep track of Highest Population Density
    if (pop_density > max_pop_density) {
        max_pop_density = pop_density
        max_pop_density_county = $1
    }
    # Keep track of Lowest Population Density
    if (pop_density < min_pop_density) {
        min_pop_density = pop_density
        min_pop_density_county = $1
    }
    # Keep track of Highest Percentage of Water
    if (percent_of_water > max_percent_of_water) {
        max_percent_of_water = percent_of_water
        max_percent_of_water_county = $1
    }
    # Keep track of Lowest Percentage of Water
    if (percent_of_water < min_percent_of_water) {
        min_percent_of_water = percent_of_water
        min_percent_of_water_county = $1
    }
}
END {
    # Print the summary of the report
    printf "\n%s %s = %.6f\n", "Highest population density", max_pop_density_county, max_pop_density
    printf "%s %s = %.6f\n", "Lowest population density", min_pop_density_county, min_pop_density
    printf "%s %s = %.6f%%\n", "Highest percent water", max_percent_of_water_county, max_percent_of_water
    printf "%s %s = %.6f%%\n", "Lowest percent water", min_percent_of_water_county, min_percent_of_water
}