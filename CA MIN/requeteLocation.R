library(tidyverse)
loc <- read.csv2("C:/Users/MELKI/Desktop/python/requeteLocation2.csv", header=TRUE, sep=";", dec=".", encoding = "UTF-8")
library(grid)
#install.packages("ggrepel")
library(ggrepel)

str(loc)
names(loc)[1]="Type"

data = loc %>% 
  filter(year == last(year))

data2= data[data$Location_percent==100,]


lastlabel="ferroviaire \n parking \n terrain \n terrain logistique"

data[8,1]="ferroviaire \n parking \n terrain \n terrain logistique"


loc %>%
  mutate(label = if_else(year == max(year), as.character(Type), NA_character_)) %>%
  ggplot(aes(x=year, y = Location_percent, group=Type)) + 
  geom_line(aes(color=Type,lty=Type,alpha=0.9)) + 
  geom_point()+ 
  geom_label_repel(aes(label = Type),nudge_x = 1,na.rm = TRUE)



ggplot() + 
  geom_line(data = loc, aes(year, Location_percent, color = Type)) +
  geom_text(data = loc %>% filter(year == last(year)), aes(label = Type, 
                                                               x = year + 0.5, 
                                                               y = Location_percent, 
                                                               color = Type), hjust=1, vjust=-1) + 
  theme_bw() +
  ylab("Pourcentage de location (%)")


ggplot() + 
  geom_line(data = loc, aes(year, Location_percent, color=Type)) +
  theme_bw() +
  ylab("Pourcentage de location (%)") +
  facet_wrap(~Type,2)