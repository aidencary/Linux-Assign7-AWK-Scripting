# Assignment 7: AWK Scripting

## Overview
AWK script that processes 2000 US Census data to generate a county report.

## Files
- `census_rpt.awk` - Main AWK script
- `census-2000.txt` - Input data (county, population, water area, land area)
- `census-2000.fmt` - Data format description
- `census_rpt.out` - Sample output

## Purpose
Calculates and reports population density (people/sq mile) and percent water for each county, while tracking min/max values.

## Usage
```bash
awk -f census_rpt.awk census-2000.txt
```

## Output
Formatted table with county names, population density, and water percentage.
