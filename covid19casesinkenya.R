######COVID 19 IN KENYA FROM 8TH TO 14TH JULY 2020 #####
library(tidyverse)
library(patchwork)
library(gganimate)
library(gifski)
library(av)
library(lubridate)
library(scales)

getwd()
setwd("D:\\Amandla")
getwd()
kenya <- read_csv("D:\\Amandla\\COVIDKENYA.csv")
View(kenya)

kenya <-  kenya %>% 
  rename(Dates = "DATES", Confirmed_Cases = "CONFIRMED CASES") 
View(kenya)

kenya$Dates <- as.Date(kenya$Dates, "%m/%d/%Y")

kenya.cases <- ggplot2::ggplot(kenya,
                               mapping = aes(x = Dates, y = Confirmed_Cases, group = 1))+
  geom_line(colour = "firebrick", linetype = "solid")+
  scale_x_date( date_breaks = "1 day", date_labels = "%d-%b")+
  scale_y_continuous(breaks = seq(0,500,50))+
  labs(title = "Covid-19 Cases in Kenya from 8th July 2020 to 14th July 2020 ",
       subtitle = "Number of Confirmed Cases",
       x = "Dates",
       y = " Confirmed Cases",
       caption = "Source: Twitter @MOH_KENYA")+
  theme(plot.title = element_text(size = 14, colour = "blue", face = "bold", hjust = 0.5),
        plot.subtitle = element_text(size = 12, face = "bold", colour = "firebrick", hjust = 0.5),
        plot.caption = element_text(size = 12, colour = "firebrick", face = "italic"),
        axis.title = element_text(size = 12, colour = "firebrick", face = "italic"),
        axis.text = element_text(size = 12, colour = "blue", face = "italic"),
        plot.background = element_rect(fill = "khaki"),
        panel.background = element_rect(fill = "khaki"),
        axis.line = element_line(size = 0.5, colour = "black"))+
  transition_reveal(Dates)
kenya.cases  
anim_save("kenyacovid1.gif", kenya.cases)