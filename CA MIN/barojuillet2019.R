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

barojuillet <- subset(baro, période=="juin 2018" | période=="juin 2019")
names(barojuillet)[1] = "Secteur"
unique(barojuillet$Secteur)

################################################   Entre les 2 derniers mois de chaque année

barojuillet1 <- subset(barojuillet, !(Secteur %in% c("Plantes en pot", "Fleurs Coupées",
                                              "Plantes en pot", "Feuillage", "Non identifié")))
f <- function(x){gsub(" et ", " \n et \n ", x)}

gsub( " ", " \n ", "Fruits et légumes")

barojuillet1$Secteur2 <- sapply(barojuillet1$Secteur, f)

p <- ggplot(barojuillet1, aes(Secteur2, poids_kg))+
  geom_bar(aes(fill=période), stat = "identity", position="dodge") +
  theme_economist() +
  theme(axis.text.x=redbold,axis.ticks.x=element_blank(),axis.title.x=element_blank()) +
  geom_text( family = "Akbar", aes(label=poids_kg, group = période), position=position_dodge(width=0.9), vjust=-0.25) +
  ggtitle("Déclaration d'arrivages sur le marché de Rungis\nentre les mois de juillet 2018 et juillet 2019 (en Milliers de Tonnes)", subtitle="Source: Département de la Semmaris") +
  scale_y_continuous(name="Poids (en Milliers de Tonnes)") +
  scale_fill_brewer(palette="Spectral")+
  theme(axis.text.x = element_text(angle = 0, vjust = 0 ,size = 10, family = "Akbar", 
                                   colour = "black", face = "bold.italic")) 

p + 
  theme(axis.text.y =  element_text(family = "Akbar", colour = "black", face = "bold.italic")) + 
  theme(axis.title.y = element_text(family = "Akbar"), legend.title = element_blank())

################################################   Annuel

barojuillet <- subset(baro, !(période=="juin 2018" | période=="juin 2019"))
names(barojuillet)[1] = "Secteur"
unique(barojuillet$Secteur)

barojuillet1 <- subset(barojuillet, !(Secteur %in% c("Plantes en pot", "Fleurs Coupées",
                                                     "Plantes en pot", "Feuillage", "Non identifié")))
f <- function(x){gsub(" et ", " \n et \n ", x)}

gsub( " ", " \n ", "Fruits et légumes")

barojuillet1$Secteur2 <- sapply(barojuillet1$Secteur, f)

p <- ggplot(barojuillet1, aes(Secteur2, poids_kg))+
  geom_bar(aes(fill=période), stat = "identity", position="dodge") +
  theme_economist() +
  theme(axis.text.x=redbold,axis.ticks.x=element_blank(),axis.title.x=element_blank()) +
  geom_text( family = "Cinzel", aes(label=poids_kg, group = période), position=position_dodge(width=0.9), vjust=-0.25) +
  ggtitle("Déclaration d'arrivages sur le marché de Rungis\nentre les cumul 2018-2019 jusqu'en juin de chaque année (en Milliers de Tonnes)", subtitle="Source: Département de la Semmaris") +
  scale_y_continuous(name="Poids (en Milliers de Tonnes)") +
  scale_fill_brewer(palette="Set1")+
  theme(axis.text.x = element_text(angle = 0, vjust = 0 ,size = 10, family = "Cinzel", 
                                   colour = "black", face = "bold.italic")) 

p + 
  theme(axis.text.y =  element_text(family = "Cinzel", colour = "black", face = "bold.italic"))  + 
  theme(axis.title.y = element_text(family = "Cinzel"), legend.title = element_blank())







