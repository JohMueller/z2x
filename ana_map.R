library(ggmap)
library(maptools)
library(sp)
library(shapefiles)
library(rgdal)
library(RColorBrewer)


#Select only Observations from GErmany
german <- full_user$lat < 55 & full_user$lat > 47.66 & full_user$lon > 6 & full_user$lon <14.5

shapefile<- readRDS('DEU_adm1.Rds')
plot(shapefile)

# full map
ggplot() +  
  geom_polygon(data=shapefile, aes(x=long, y=lat, group=group), col = "black")+
  geom_count(data=full_user[german,],aes(x=lon, y=lat), color = "pink") +
  theme(line = element_blank(),
                                                          text = element_blank(),
                                                          title = element_blank(),
                                                          legend.position = 0,
                                                          panel.grid.major = element_blank(),
                                                          panel.grid.minor = element_blank(),
                                                          panel.background = element_blank())

# Map for ZX2 2017

ggplot() +  
  geom_polygon(data=shapefile, aes(x=long, y=lat, group=group), col = "black")+
  geom_count(data=full_user[german & full_user$Z2X17 == 1,],
             aes(size = (..prop..)*1.5 ,x=lon,
                                         y=lat), color = "pink") + theme(line = element_blank(),
                                                                          text = element_blank(),
                                                                          #title = "ZX2 2017",
                                                                          legend.position = 0,
                                                                          panel.grid.major = element_blank(),
                                                                          panel.grid.minor = element_blank(),
                                                                          panel.background = element_blank())

# Map for ZX2 2016

ggplot() +  
  geom_polygon(data=shapefile, aes(x=long, y=lat, group=group), col = "black")+
  geom_count(data=full_user[german & full_user$Z2X16 == 1,],
             aes(size =(..prop..),x=lon,
                 y=lat), color = "pink") + theme(line = element_blank(),
                                                 text = element_blank(),
                                                 #title = "ZX2 2017",
                                                 legend.position = 0,
                                                 panel.grid.major = element_blank(),
                                                 panel.grid.minor = element_blank(),
                                                 panel.background = element_blank())

# Map for ZX3 Essen

ggplot() +  
  geom_polygon(data=shapefile, aes(x=long, y=lat, group=group), col = "black")+
  geom_count(data=full_user[german & full_user$Z2XEssen == 1,],
             aes(x=lon,
                 y=lat), color = "pink") + theme(
                   line = element_blank(),
                                                 #text = element_blank(),
                                                 legend.position = 0,
                                                 panel.grid.major = element_blank(),
                                                 panel.grid.minor = element_blank(),
                                                 panel.background = element_blank(),
                   axis.title.x=element_blank(),
                   axis.text.x=element_blank(),
                   axis.ticks.x=element_blank(),
                   axis.text.y=element_blank(),
                   axis.ticks.y=element_blank(),
                   axis.title.y=element_blank()) +
  ggtitle("Z2X Essen") + 
               scale_size(range = c(3, 10), trans = "log1p")

# Map for ZX3 Leipzig

ggplot() +  
  geom_polygon(data=shapefile, aes(x=long, y=lat, group=group), col = "black")+
  geom_count(data=full_user[german & full_user$Z2XLeipzig == 1,],
             aes(x=lon,
                 y=lat), color = "pink") + theme(
                   line = element_blank(),
                   #text = element_blank(),
                   legend.position = 0,
                   panel.grid.major = element_blank(),
                   panel.grid.minor = element_blank(),
                   panel.background = element_blank(),
                   axis.title.x=element_blank(),
                   axis.text.x=element_blank(),
                   axis.ticks.x=element_blank(),
                   axis.text.y=element_blank(),
                   axis.ticks.y=element_blank(),
                   axis.title.y=element_blank()) +
  ggtitle("Z2X Leipzig")+ 
  scale_size(range = c(3, 10), trans = "log1p")

# Map for ZX3 Stuttgart

ggplot() +  
  geom_polygon(data=shapefile, aes(x=long, y=lat, group=group), col = "black")+
  geom_count(data=full_user[german & full_user$Z2XStuttgart == 1,],
             aes(x=lon,
                 y=lat), color = "pink") + theme(
                   line = element_blank(),
                   #text = element_blank(),
                   legend.position = 0,
                   panel.grid.major = element_blank(),
                   panel.grid.minor = element_blank(),
                   panel.background = element_blank(),
                   axis.title.x=element_blank(),
                   axis.text.x=element_blank(),
                   axis.ticks.x=element_blank(),
                   axis.text.y=element_blank(),
                   axis.ticks.y=element_blank(),
                   axis.title.y=element_blank()) +
  ggtitle("Z2X Stuttgart")+ 
  scale_size(range = c(3, 10), trans = "log1p")

# Map for ZX3 2016

ggplot() +  
  geom_polygon(data=shapefile, aes(x=long, y=lat, group=group), col = "black")+
  geom_count(data=full_user[german & full_user$Z2X16 == 1,],
             aes(x=lon,
                 y=lat), color = "pink") + theme(
                   line = element_blank(),
                   #text = element_blank(),
                   legend.position = 0,
                   panel.grid.major = element_blank(),
                   panel.grid.minor = element_blank(),
                   panel.background = element_blank(),
                   axis.title.x=element_blank(),
                   axis.text.x=element_blank(),
                   axis.ticks.x=element_blank(),
                   axis.text.y=element_blank(),
                   axis.ticks.y=element_blank(),
                   axis.title.y=element_blank()) +
  ggtitle("Z2X 2016")+ 
  scale_size(range = c(3, 10), trans = "log1p")

# Map for ZX3 2017

ggplot() +  
  geom_polygon(data=shapefile, aes(x=long, y=lat, group=group), col = "black")+
  geom_count(data=full_user[german & full_user$Z2X17 == 1,],
             aes(x=lon,
                 y=lat), color = "pink") + theme(
                   line = element_blank(),
                   #text = element_blank(),
                   legend.position = 0,
                   panel.grid.major = element_blank(),
                   panel.grid.minor = element_blank(),
                   panel.background = element_blank(),
                   axis.title.x=element_blank(),
                   axis.text.x=element_blank(),
                   axis.ticks.x=element_blank(),
                   axis.text.y=element_blank(),
                   axis.ticks.y=element_blank(),
                   axis.title.y=element_blank()) +
  ggtitle("Z2X 2017")+ 
  scale_size(range = c(3, 10), trans = "log1p")

# Map for ZX Full

ggplot() +  
  geom_polygon(data=shapefile, aes(x=long, y=lat, group=group), col = "black")+
  geom_count(data=full_user[german,],
             aes(x=lon,
                 y=lat), color = "pink") + theme(
                   line = element_blank(),
                   #text = element_blank(),
                   legend.position = 0,
                   panel.grid.major = element_blank(),
                   panel.grid.minor = element_blank(),
                   panel.background = element_blank(),
                   axis.title.x=element_blank(),
                   axis.text.x=element_blank(),
                   axis.ticks.x=element_blank(),
                   axis.text.y=element_blank(),
                   axis.ticks.y=element_blank(),
                   axis.title.y=element_blank()) +
  ggtitle("Z2X Full")+ 
  scale_size(range = c(3, 10), trans = "log1p")
