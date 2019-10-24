library(tidyverse)

library(grid)
library(ggrepel)

loc <- read.csv2("C:/Users/MELKI/Desktop/python/businessplan.csv", header=TRUE, sep=";", dec=".", encoding = "UTF-8")

str(loc)
names(loc)[1]="Type"

summary(loc)

data = loc %>% 
  filter(year == last(year))

data2= data[data$Location_percent==100,]

"""
lastlabel="ferroviaire \n parking \n terrain \n terrain logistique"

data[8,1]="ferroviaire \n parking \n terrain \n terrain logistique"


loc %>%
  mutate(label = if_else(year == max(year), as.character(Type), NA_character_)) %>%
  ggplot(aes(x=year, y = Location_percent, group=Type)) + 
  geom_line(aes(color=Type,lty=Type,alpha=0.9)) + 
  geom_point()+ 
  geom_label_repel(aes(label = Type),nudge_x = 1,na.rm = TRUE)
"""


ggplot() +
  geom_point(data = loc, aes(year, surface..km2., color = Type)) +
  geom_line(data = loc, aes(year, surface..km2., color = Type), size=1) +
  geom_text(data = loc %>% filter(year == first(year)), aes(label = Type, 
                                                           x = year + 0.5, 
                                                           y = surface..km2., 
                                                           color = Type), hjust=0, vjust=0, size=3.5) + 
  theme_bw() +
  ylab("Surface (km2)") + 
  xlim(2019, 2035) +
  scale_x_continuous("Année", labels = as.character(loc$year), breaks = loc$year)



ggplot()  +
  geom_point(data = loc, aes(year, surface..km2., color = Type)) + 
  geom_line(data = loc, aes(year, surface..km2., color = Type),size=1) +
  theme_bw() +
  facet_wrap(nrow =3, ~Type) +
  ylab("Surface (km2)") + 
  xlim(2019, 2035) +
  scale_x_continuous("Année", labels = as.character(loc$year), breaks = loc$year)







