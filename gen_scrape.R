library(rvest)
library(xlsx)
library(stringr)

return_participants_list <- function(html){

  html <- read_html(html)

  user_description <- html %>%
    html_nodes(".user-short-bio-normal")%>%
    html_text()
  
  user_conferences <- html %>%
    html_nodes(".flags")%>%
    html_text()
  
  user_city <- str_match_all(html, "data-city=.*?data.firstname")
  user_city <- str_match_all(user_city, "=.*?\\sd")
  user_city <- str_sub(unlist(user_city), 4, -5)
  
  
  ### Create Dataframe
  user <- data.frame(cbind(city = user_city, desc = unlist(user_description)))
  
    # match conferences
  
  user$Z2X17 <- rep(0, nrow(user))
  user$Z2X17[grepl("Z2X17", unlist(user_conferences))] <- 1
  
  user$Z2X16 <- rep(0, nrow(user))
  user$Z2X16[grepl("Z2X16", unlist(user_conferences))] <- 1
  
  user$Z2XEssen <- rep(0, nrow(user))
  user$Z2XEssen[grepl("Essen", unlist(user_conferences))] <- 1
  
  user$Z2XLeipzig <- rep(0, nrow(user))
  user$Z2XLeipzig[grepl("Leipzig", unlist(user_conferences))] <- 1
  
  user$Z2XStuttgart <- rep(0, nrow(user))
  user$Z2XStuttgart[grepl("Stuttgart", unlist(user_conferences))] <- 1

return(user)
}

