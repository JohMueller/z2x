# Stats
library(maptools)
library(maps)
library(RColorBrewer)

full_user$desc <- tolower(full_user$desc)
sum(grepl("stud", full_user$desc))

217/1000

### wie viele leute kommen nicht aus Deutschland?

sum(!german, na.rm = T)/1000

## try network plot

curves_df <- data.frame(x1 = 12.09915, x2 =13.40495 , y1= 54.09244, y2 = 52.52001, meetup = 1, type = 1)


for (i in 1:nrow(full_user)){
  print(full_user[i, c("lon", "lat")])
  
  if(german[i] & !is.na(german[i])){
    
    if(full_user$Z2X16[i] == 1){
      df_new <- data.frame(x1 = full_user$lon[i], x2 =13.40495 ,
                 y1= full_user$lat[i], y2 = 52.52001, meetup = 1, type = 1)
      curves_df <- rbind(curves_df, df_new)
    }
    
    if(full_user$Z2X17[i] == 1){
      df_new <- data.frame(x1 = full_user$lon[i], x2 =13.40495 ,
                           y1= full_user$lat[i], y2 = 52.52001, 
                           meetup = 2, type = 1)
      curves_df <- rbind(curves_df, df_new)
    }
    
    if(full_user$Z2XEssen[i] == 1){
      df_new <- data.frame(x1 = full_user$lon[i], x2 =7.011555 ,
                           y1= full_user$lat[i], y2 = 51.45564, 
                           meetup = 3, type = 2)
      curves_df <- rbind(curves_df, df_new)
    }
    
    if(full_user$Z2XLeipzig[i] == 1){
      df_new <- data.frame(x1 = full_user$lon[i], x2 =12.37307 ,
                           y1= full_user$lat[i], y2 = 51.3397, 
                           meetup = 4, type = 2)
      curves_df <- rbind(curves_df, df_new)
    }
    
    if(full_user$Z2XStuttgart[i] == 1){
      df_new <- data.frame(x1 = full_user$lon[i], x2 =9.182932 ,
                           y1= full_user$lat[i], y2 = 48.77585, 
                           meetup = 5, type = 2)
      curves_df <- rbind(curves_df, df_new)
    }
  }
}

ggplot() +  
  geom_polygon(data=shapefile, aes(x=long, y=lat, group=group),fill = "black", col = "#687687")+
  geom_count(data=full_user[german,], aes(x=lon, y=lat), color = "#b8eaed", size = 0.7) +
  theme(           line = element_blank(),
                   legend.position = 0,
                   panel.grid.major = element_blank(),
                   panel.grid.minor = element_blank(),
                   panel.background = element_rect(fill="black"),
                   axis.title.x=element_blank(),
                   axis.text.x=element_blank(),
                   axis.ticks.x=element_blank(),
                   axis.text.y=element_blank(),
                   axis.ticks.y=element_blank(),
                   axis.title.y=element_blank(),
                   plot.background = element_rect(fill="black")) +
  ggtitle("Z2X Full")+ 
  geom_curve(aes(x = x1, y = y1, xend = x2, yend = y2,
                 colour = as.factor(meetup),
                 alpha = 0.1),
             curvature = 0.1,
             size = 1.05,
             colour= "#687687",
             data = curves_df[curves_df$meetup == 1,])+
  geom_curve(aes(x = x1, y = y1, xend = x2, yend = y2,
                 colour = as.factor(meetup),
                 alpha = 0.1),
             curvature = 0.15,
             size = 1.05,
             colour= "#687690",
             #colour = "#7df9ff",
             data = curves_df[curves_df$meetup == 2,])+
  geom_curve(aes(x = x1, y = y1, xend = x2, yend = y2,
                 colour = as.factor(meetup),
                 alpha = 0.1),
             curvature = 0.1,
             colour= "#7df9ff",
             #colour = "#ff304f",
             data = curves_df[curves_df$meetup >= 3,])
  