library(tidyverse)
ca2018 <- read.csv2("C:/Users/MELKI/Desktop/python/analyse stat CA2018.csv", header=TRUE, sep=";", dec=".", encoding = "UTF-8")
ca2017 <- read.csv2("C:/Users/MELKI/Desktop/python/analyse stat CA2017bis.csv", header=TRUE, sep=";", dec=".", encoding = "UTF-8")


b = ca2017 %>% 
  group_by(Filiere, Annee) %>% 
  summarise(CaMin = sum(CaMin, na.rm=T),CaMinN1 = sum(CaMinN1, na.rm=T),EffectifTot = sum(EffectifTot, na.rm =T))

b$CaMin=round(b$CaMin/1000000,0)
b$EffectifTot=round(b$EffectifTot,0)

