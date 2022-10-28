# U.S. Hurricane Evacuation Orders Dataset
## Overview
This dataset contains hurricane evacuation order information collected during a 3-year study conducted by the National Center for Atmospheric Research (NCAR, https://ncar.ucar.edu/) and funded by NOAA/WPO.  **Evacuation orders were only collected for the time period leading up to landfall - orders may have been ordered after landfall that are not reflected in this dataset.** These datasets were hand-collected and curated by Andrea Schumacher (andreasch@ucar.edu) for use in our study, and are being shared here for use in other research related to these cases.  **If you use this data, please use the following citation:**

[![DOI](https://zenodo.org/badge/557408710.svg)](https://zenodo.org/badge/latestdoi/557408710)

## Cases:
* Ian 2022 - *This is a limited early release of Ian data to expedite research. More cases coming soon!*

## Data Fields
* STORM NAME - The common name of the storm.  E.g., "Ian" or "Katrina".
* ATCF ID - The 6-digit Automated Tropical Cyclone Forecast (AFCF) identification code. This includes a 2-character basin indicator, 2-digit storm number, and 4-digit year.  Example:  Hurricane Ian occurred in the Atlantic basin in 2022 and was the 9th storm in the ATCF record --> "AL092022".
* STATE - 2-character state.  E.g., "FL".
* COUNTY - County name, with first letter capitalized.  E.g., "Sarasota".
* FIPS - Federal Information Processing Series, a 5-digit code assigned by NIST to each U.S. county (https://support.esri.com/en/technical-article/000002594). First 2 digits indicate the state and last 3 digit indicate county.  
* START TIME, UTC - The time of the start of the evacuation order.  This will be the time evacuation went into effect or, if not explicitly stated, the first announcement of said evacuation that was found. Format is YYYYMMDDHHHH, where YYYY = year, MM = month, DD = day, and HH = hour. Given as Coordinated Universal Time (UTC).  NOT LOCAL TIME.
* END TIME, UTC - The time of the end of the evacuation order.  End times (also referred to as times rescinded or lifted) were not always available, so left blank if an end time was not found. Format is YYYYMMDDHHHH, where YYYY = year, MM = month, DD = day, and HH = hour. Given as Coordinated Universal Time (UTC).  NOT LOCAL TIME.  NOTE: in some cases, only the day was found for the end of order.  In those cases the last minute of the day (2359) was used.
* SUPPLEMENTAL FILES - When an official evacuation document or news release was found, the file was saved.  These files are located in the subfolder "supplemental_files".
* URL - Sources used to determine evacuation information.
* ZONE(S) - The specific spatial zones or areas under the evacuation order for all residents (often, but not always, pre-defined as in FL)
* VULNERABILITY TAGS - Many U.S. evacuation orders include different types of evacuations; 1) blanket evacuations of all people within specific areas and 2) evacuations of people with specific vulnerabilities (e.g., living in unsafe structures, being registered as having special needs, or living in areas prone to or with a history of flooding) within a larger area (often county-wide).
* NOTES - My own notes taken during the data collection process. These may include more specific information about evacuation zones/areas, language used in the orders, etc.

## Data Limitations
* Mandatory evacuation orders only (voluntary is a work in progress)
* Collected by a single person (Andrea Schumacher). Although I tried to use a consistent search strategy, the focus was on gathering the best data possible for our research and not necessarily repeatability and reproducibility.  
* Gathered at county level. There is supplementary information included via text and files that can help users interpret to finer spatial scales, but overall the dataset is most useful in its current form for county-level analyses.
* Missing many end times. However, users can fill in missing values with times that work for their analyses (for us, that was the end times of our survey waves)
