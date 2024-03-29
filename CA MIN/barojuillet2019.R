library(tidyverse)
baro <- read.csv2("barojuillet2019.csv", header=TRUE, sep=";", dec=".", encoding = "UTF-8")
library("ggthemes")
library("ggplot2")



library("hrbrthemes")
library(extrafont)
loadfonts()

fonts()
font_import(prompt = TRUE)
fonts()


head(baro)

barojuillet <- subset(baro, p�riode=="juin 2018" | p�riode=="juin 2019")
names(barojuillet)[1] = "Secteur"
unique(barojuillet$Secteur)

################################################   Entre les 2 derniers mois de chaque ann�e

barojuillet1 <- subset(barojuillet, !(Secteur %in% c("Plantes en pot", "Fleurs Coup�es",
                                              "Plantes en pot", "Feuillage", "Non identifi�")))
f <- function(x){gsub(" et ", " \n et \n ", x)}

gsub( " ", " \n ", "Fruits et l�gumes")

barojuillet1$Secteur2 <- sapply(barojuillet1$Secteur, f)

p <- ggplot(barojuillet1, aes(Secteur2, poids_kg))+
  geom_bar(aes(fill=p�riode), stat = "identity", position="dodge") +
  theme_economist() +
  theme(axis.text.x=redbold,axis.ticks.x=element_blank(),axis.title.x=element_blank()) +
  geom_text( family = "Akbar", aes(label=poids_kg, group = p�riode), position=position_dodge(width=0.9), vjust=-0.25) +
  ggtitle("D�claration d'arrivages sur le march� de Rungis\nentre les mois de juillet 2018 et juillet 2019 (en Milliers de Tonnes)", subtitle="Source: D�partement de la Semmaris") +
  scale_y_continuous(name="Poids (en Milliers de Tonnes)") +
  scale_fill_brewer(palette="Spectral")+
  theme(axis.text.x = element_text(angle = 0, vjust = 0 ,size = 10, family = "Akbar", 
                                   colour = "black", face = "bold.italic")) 

p + 
  theme(axis.text.y =  element_text(family = "Akbar", colour = "black", face = "bold.italic")) + 
  theme(axis.title.y = element_text(family = "Akbar"), legend.title = element_blank())

################################################   Annuel

barojuillet <- subset(baro, !(p�riode=="juin 2018" | p�riode=="juin 2019"))
names(barojuillet)[1] = "Secteur"
unique(barojuillet$Secteur)

barojuillet1 <- subset(barojuillet, !(Secteur %in% c("Plantes en pot", "Fleurs Coup�es",
                                                     "Plantes en pot", "Feuillage", "Non identifi�")))
f <- function(x){gsub(" et ", " \n et \n ", x)}

gsub( " ", " \n ", "Fruits et l�gumes")

barojuillet1$Secteur2 <- sapply(barojuillet1$Secteur, f)

p <- ggplot(barojuillet1, aes(Secteur2, poids_kg))+
  geom_bar(aes(fill=p�riode), stat = "identity", position="dodge") +
  theme_economist() +
  theme(axis.text.x=redbold,axis.ticks.x=element_blank(),axis.title.x=element_blank()) +
  geom_text( family = "Cinzel", aes(label=poids_kg, group = p�riode), position=position_dodge(width=0.9), vjust=-0.25) +
  ggtitle("D�claration d'arrivages sur le march� de Rungis\nentre les cumul 2018-2019 jusqu'en juin de chaque ann�e (en Milliers de Tonnes)", subtitle="Source: D�partement de la Semmaris") +
  scale_y_continuous(name="Poids (en Milliers de Tonnes)") +
  scale_fill_brewer(palette="Set1")+
  theme(axis.text.x = element_text(angle = 0, vjust = 0 ,size = 10, family = "Cinzel", 
                                   colour = "black", face = "bold.italic")) 

p + 
  theme(axis.text.y =  element_text(family = "Cinzel", colour = "black", face = "bold.italic"))  + 
  theme(axis.title.y = element_text(family = "Cinzel"), legend.title = element_blank())







