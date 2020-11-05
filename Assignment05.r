library(data.table)
library(tidyverse)
library(stringr)

DF <- read.csv("USvideos.csv")
attach(DF)

#Convert "trending_date" to an R date object
DF$trending_date <-DF$trending_date %>% as.Date(format= "%y,%d,%m")

#Split "publish_time" into "PDate" and "PTime" columns, then convert each to date and time objects
DF <- DF %>% separate(col = publish_time, into = c("PDate", "PTime"), "T", extra="merge")
DF$PDate <- as.Date(DF$PDate)

DF$PTime <- DF$PTime %>% substr(1,nchar(DF$PTime)-5) 
DF$PTime <- as.POSIXct(paste(DF$PDate, DF$PTime), format="%Y-%m-%d %H:%M:%S")

#Capitalize the first letter in  "title"
DF$title <- str_to_title(title)

View(DF)
