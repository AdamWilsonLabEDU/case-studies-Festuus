Project Proposal Template
================
Festus Adegbola

# Introduction to problem/question

The Osprey (Pandion haliaetus) is a migratory bird species with a broad
distribution across North America. My project will explore seasonal
trends in Osprey occurrences across the United States by comparing the
geographic distribution and timing of sightings in Flickr photos with
data from eBird. The primary goal is to assess whether trends in the
presence and migration patterns of Ospreys, as seen in Flickr images,
match the patterns from eBird observations. By doing so, the project
seeks to provide insight into the correlation between photo-based
citizen science data, as well as to highlight how social media platforms
like Flickr can contribute to ecological studies.

# Problem / Question

Can we crowd-source the presence/absence data of a bird species from
social media data?

# Inspiring Examples

\##Example1
![](https://ars.els-cdn.com/content/image/1-s2.0-S0048969719323095-ga1_lrg.jpg)
This article used social media data, mined from Flickr and Twitter,
geolocated in Important Bird and Biodiversity Areas (IBAs) to assess i)
patterns of popularity; ii) relationships of this popularity with
geographical and biological variables; and iii) identify sites under
high pressure from visitors. I selected this example as it uses the same
data source, Flickr, as I propose to use for my project.

## Example 2

![](https://ars.els-cdn.com/content/image/1-s2.0-S2351989421002304-gr3_lrg.jpg)

Similarly, citizen science projects contributed to the shortfall in data
for biodiversity monitoring and promoted public stewardship of nature in
Tropical Biodiversity Area. The authors document and analyse
BigMonth2020, a month-long birdwatching event across Java and Bali,
publicised through social media and incentivised with grants and
competitions.

## Example 3

![](https://www.biorxiv.org/content/biorxiv/early/2024/04/01/2024.03.29.587372/F2.large.jpg)
Here, the authors evaluated the potential of social media as a citizen
science data source for bird-window collision (BWC), They collected BWC
data on social media Facebook as well as Taiwan Roadkill Observation
Network (TaiRON), the main dedicated citizen science platform for
reporting wildlife mortalities in Taiwan. The authors then compared a
decade of BWC data (2012–2022) from the two platforms by examining the
nationwide geographical coverage and the species compositions of the BWC
observations. This project is a relevant example of how social media
data has been used to explore ecological understandings.

# Proposed data sources

Flickr Photos: Flickr’s public API will be used to gather geotagged
images of Ospreys from across the U.S. by querying hashtags such as
“\#Osprey” and related keywords. Timeframe: Images will be filtered by
date to analyze seasonal trends. API Documentation: Flickr API

eBird Data: eBird’s occurrence and observation data will be accessed
through their data portal, focusing on Osprey sightings across the U.S.
The data will include location, date, and number of birds observed. API
Documentation: eBird API

# Proposed methods

Data Collection: Use the Flickr API to collect images tagged with
“Osprey” and related keywords. Download metadata including location,
date, and time of posting. Use the eBird API to gather occurrence data
for Ospreys across the U.S., filtering by date range to match the
temporal scope of the Flickr data.

Data Preprocessing: Clean and standardize both datasets (Flickr and
eBird) to ensure consistency in location formats (e.g., converting
geocoordinates to the same projection) and time intervals. Handle any
missing or incomplete data from both sources by imputing values or
filtering out incomplete records.

Data Integration: Combine the datasets (Flickr and eBird) based on
geographic location and time (seasonal patterns) to compare Osprey
occurrences. Create a spatial analysis using R packages like sf for
spatial data handling and dplyr for data manipulation.

Visualization: Use ggplot2 for initial seasonal trend visualizations
(e.g., month-by-month comparison of Flickr sightings vs. eBird
observations). Create an interactive map with leaflet to visualize
geographic patterns of Osprey sightings based on both data sources.
Generate a heatmap to compare Osprey presence across the U.S. by season,
using both the Flickr and eBird datasets.

# Expected results

A set maps showing the geographic distribution of Osprey sightings over
time, comparing the patterns in Flickr photos with eBird data. Seasonal
trend graphs that demonstrate the timing of Osprey presence across the
U.S. based on both data sources, highlighting any matching patterns or
discrepancies. A final report summarizing findings, with a focus on
identifying migration trends and any correlation between photo-based
data and formal bird observation data.
