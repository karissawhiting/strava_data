#devtools::install_github("marcusvolz/strava")
library(strava)
library(tidyverse)
library(ggmap)

sas_data<- process_data("/Users/Whiting/Repositories/strava_data/data-raw/SAS_022018")


p1  <-  plot_facets ( sas_data ) 
plot_map(sas_data, lon_min =  min(sas_data$lon) , lon_max =  max(sas_data$lon) , lat_min =  min(sas_data$lat) , lat_max = max(sas_data$lat)) 


sas_data <- sas_data %>%
  group_by(id) %>%
  summarise(rate = max(cumdist)/ max(cumtime))

p <- ggplot() +
  geom_path(aes(lon, lat, group = id, colour = dist_to_prev),
                       sas_data %>% dplyr::filter(lon > min(sas_data$lon), lon < max(sas_data$lon), lat > min(sas_data$lat), lat < max(sas_data$lat)),
                       alpha = 0.3, size = 0.3, lineend = "round") +
  coord_map() +
  theme_void()
  
  # Return plot
  p


ggmap(get_map(location = "los angeles", zoom = 7)) +
ggplot() +
  geom_path(aes(lon, lat, group = id),
            sas_data %>% dplyr::filter(lon > min(sas_data$lon), lon < max(sas_data$lon), lat > min(sas_data$lat), lat < max(sas_data$lat)),
            alpha = 0.3, size = 0.3, lineend = "round") +
  coord_map() +
  theme_void()
#qmap(location = "los angeles")
