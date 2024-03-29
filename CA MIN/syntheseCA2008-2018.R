# Data Visualization with ggplot
# Bars and Columns
# Video 2.3

# Load the dataset as described in Video 1.3
library(tidyverse)

#install.packages("ggthemes")
library(ggthemes)

synth <- read.csv2("C:/Users/MELKI/Desktop/python/syntheseCA.csv", header=TRUE, sep=";", dec=".", encoding = "UTF-8")

names(synth)[1]="Ann�e"

synth <- synth %>%
  mutate(Ann�e=as.factor(Ann�e))

redbold <- element_text(face = "bold", color = "red")
couleur = c("red","grey","grey","grey","grey","grey","grey","grey","grey","grey","blue")

# How many schools are in each region?
# This calls for a bar graph!
ggplot(synth, aes(Ann�e, CA)) +
  geom_bar(aes(fill=couleur), stat = "identity", show.legend = F) +
  theme_economist() +
  theme(axis.text.x=redbold,axis.ticks.x=element_blank(),axis.title.x=element_blank()) +
  geom_text(aes(label=CA), position=position_dodge(width=0.9), vjust=-0.25) +
  scale_fill_manual(values=couleur)+
  ggtitle("Evolution du chiffre d'affaires sur le march� de Rungis de 2008 � 2018 (M???)", subtitle="Source: Semmaris") +
  scale_y_continuous(name="Chiffre d'affaires (M???)")



