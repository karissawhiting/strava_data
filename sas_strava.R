devtools::install_github("marcusvolz/strava")
library(strava)
library(tidyverse)

sas_data<- process_data("/Users/Whiting/Repositories/strava_data/data-raw/SAS_022018")

p1   <-   plot_facets ( sas_data ) 
plot_map (sas_data, lon_min =  min(sas_data$lon) , lon_max =  max(sas_data$lon) , lat_min =  min(sas_data$lat) , lat_max = max(sas_data$lat)) 
