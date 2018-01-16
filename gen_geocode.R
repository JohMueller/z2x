### Scrape different html settings

library(rvest)
library(xlsx)
library(stringr)
library(ggmap)

full_user <- return_participants_list("visionaere_full.html")
  
write.csv(full_user, "full_user.csv", col.names = T, row.names = F)

### try to geocode locations

cities <- as.character(levels(full_user$city))

geo_lon <- c()
geo_lat <- c()
for(i in 1:length(cities)){
geo <- geocode(cities[i], output = "latlon")

geo_lon[i] <- geo[1]
geo_lat[i] <- geo[2]

}

cities_df <- data.frame(cbind(cities, 
                              as.numeric(geo_lon), 
                              as.numeric(geo_lat)))

full_user$lon <- rep(NA, nrow(full_user))
full_user$lat <- rep(NA, nrow(full_user))

for(i in 1:nrow(full_user)){
  k <- which(full_user$city[i] == cities)
  full_user$lon[i] <- geo_lon[[k]]
  full_user$lat[i] <- geo_lat[[k]]
}


