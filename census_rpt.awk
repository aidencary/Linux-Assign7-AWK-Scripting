#!usr/bin/awk -f
# Author: Aiden Cary
# Date: April 06, 2026
# Assignment 7: AWK Scripting
BEGIN {
    # Delimiter is a tab
    FS = "\t"
    # Print the header for the report
    printf "%-20s %15s %12s\n", "Country", "Pop/Sq Mile", "% Water"
    # Print a line of dashes to separate the header from the data
    printf "%-20s %15s %12s\n", "------------", "---------------", "------------"
}
{
    # Calculate the pop density (num of people / landarea)
    pop_density = $2 / $4
    # Calculate the percent of water ((water / (water + land)) * 100)
    percent_of_water = (($3 / ($3 + $4)) * 100)
    # Print the report line 
    #(with a precision of 6 for the pop density and percent of water)
    printf "%-20s %15.6f %12.6f\n", $1, pop_density, percent_of_water
}