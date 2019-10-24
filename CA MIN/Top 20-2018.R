library(tidyverse)
rank <- read.csv2("C:/Users/MELKI/Desktop/python/ranking.csv", header=TRUE, sep=";", dec=".", encoding = "UTF-8")

library(dplyr)
library(ggthemes)

names(rank)[1]="RS_2018"
head(rank)

str(rank)
summary(rank)


#############################Fruits et légumes #######################################################



rfl = filter(rank, TypeFilère == "Fruits et légumes")
# rfl = filter(rank, TypeFilère == "Fruits et légumes")


head(rfl)


rf12018 = rfl[,c(1,2,5,7)]

rf12018=add_column(rf12018, year = 2018)

names(rf12018)[2]="CA"

df = rf12018

df$year=as.factor(df$year)

df$CA=round(df$CA/1000000,2)

couleur <- function(x){
  if (x < 0) { y <- "red"}
  else {y <- "#006400"}
}

class(df$Evolution)
df$Evolution = as.character(df$Evolution)

# df$EvolutionBis = as.numeric(gsub("%","",as.character(df$Evolution)))  

df$cooler = sapply(df$Evolution, couleur)
  

maxi = max(df$CA, na.rm = T) + 50

ggplot(df, aes(x=reorder(RS_2018, -Ranking), CA, ymax = maxi, ymin = 0)) + 
  geom_bar(stat="identity", position="dodge", fill = "seagreen4", color="black", width = 0.75) + 
  coord_flip() +
  theme(axis.title.y = element_text(family="arial", face="bold.italic", size=12)) + 
  labs(x = NULL) +
  ylab("Chiffre d'affaires (M???)")+
  theme(plot.title=element_text( hjust=0.5, vjust=0.5, face='bold')) +
  theme_economist(base_size = 8, base_family = "Verdana",
                  dkpanel = F, horizontal = F) + 
  geom_text(aes(label = CA), position = position_dodge(1),
            hjust = -0.3, size = 3.5, fontface=2) + 
  geom_text(aes(label = Evolution),
            hjust = -2.5, size = 3.5, color=df$cooler, fontface=4)+
  ggtitle("Chiffre d'affaires par Entreprise selon la filière Fruits et légumes\n en Millions d'euros  (Top 20) pour l'année 2018"
          , subtitle="Source: Semmaris")



#############################Produits de la mer#######################################################





rfl = filter(rank, TypeFilère == "Produits de la mer")
# rfl = filter(rank, TypeFilère == "Fruits et légumes")


head(rfl)


rf12018 = rfl[,c(1,2,5,7)]

rf12018=add_column(rf12018, year = 2018)


names(rf12018)[2]="CA"


df = rf12018

df$year=as.factor(df$year)

df$CA=round(df$CA/1000000,2)

couleur <- function(x){
  if (x < 0) { y <- "red"}
  else {y <- "#006400"}
}

class(df$Evolution)
df$Evolution = as.character(df$Evolution)

# df$EvolutionBis = as.numeric(gsub("%","",as.character(df$Evolution)))  

df$cooler = sapply(df$Evolution, couleur)

maxi = max(df$CA, na.rm = T) + 50

ggplot(df, aes(x=reorder(RS_2018, -Ranking), CA, ymax = maxi, ymin = 0)) + 
  geom_bar(stat="identity", position="dodge", fill="deepskyblue", color="black", width = 0.75) + 
  coord_flip() +
  theme(axis.title.y = element_text(family="arial", face="bold.italic", size=12)) + 
  labs(x = NULL) +
  ylab("Chiffre d'affaires (M???)")+
  theme(plot.title=element_text( hjust=0.5, vjust=0.5, face='bold')) +
  theme_economist(base_size = 8, base_family = "Verdana",
                  dkpanel = F, horizontal = F) + 
  geom_text(aes(label = CA), position = position_dodge(1),
            hjust = -0.3, size = 3.5, fontface=2) + 
  geom_text(aes(label = Evolution),
            hjust = -2.5, size = 3.5, color=df$cooler, fontface=4)+
  ggtitle("Chiffre d'affaires par Entreprise selon la filière Produits de la mer en Millions d'euros  (Top 20) pour l'année 2018"
          , subtitle="Source: Semmaris") 


#############################Produits laitiers #######################################################



rfl = filter(rank, TypeFilère == "Produits laitiers ")
# rfl = filter(rank, TypeFilère == "Fruits et légumes")
unique(rank$TypeFilère)

head(rfl)


rf12018 = rfl[,c(1,2,5,7)]

rf12018=add_column(rf12018, year = 2018)


names(rf12018)[2]="CA"

df = rf12018

df$year=as.factor(df$year)

df$CA=round(df$CA/1000000,2)

couleur <- function(x){
  if (x < 0) { y <- "red"}
  else {y <- "#006400"}
}

class(df$Evolution)
df$Evolution = as.character(df$Evolution)

# df$EvolutionBis = as.numeric(gsub("%","",as.character(df$Evolution)))  

df$cooler = sapply(df$Evolution, couleur)

maxi = max(df$CA, na.rm = T) + 50

ggplot(df, aes(x=reorder(RS_2018, -Ranking), CA, ymax = maxi, ymin = 0)) + 
  geom_bar(stat="identity", position="dodge", fill="#FFFFCC", color="black", width = 0.75) + 
  coord_flip() +
  theme(axis.title.y = element_text(family="arial", face="bold.italic", size=12)) + 
  labs(x = NULL) +
  ylab("Chiffre d'affaires (M???)")+
  theme(plot.title=element_text( hjust=0.5, vjust=0.5, face='bold')) +
  theme_economist(base_size = 8, base_family = "Verdana",
                  dkpanel = F, horizontal = F) + 
  geom_text(aes(label = CA), position = position_dodge(1),
            hjust = -0.2, size = 3.5, fontface=2) + 
  geom_text(aes(label = Evolution),
            hjust = -2, size = 3.5, color=df$cooler, fontface=4)+
  ggtitle("Chiffre d'affaires par Entreprise selon la filière produits laitiers en Millions d'euros  (Top 20) pour l'année 2018"
          , subtitle="Source: Semmaris")


#############################Produits traiteurs#######################################################




rfl = filter(rank, TypeFilère == "Produits traiteurs")

unique(rank$TypeFilère)

head(rfl)


rf12018 = rfl[,c(1,2,5,7)]

rf12018=add_column(rf12018, year = 2018)


names(rf12018)[2]="CA"

df = rf12018

df$year=as.factor(df$year)

df$CA=round(df$CA/1000000,2)

couleur <- function(x){
  if (x < 0) { y <- "red"}
  else {y <- "#006400"}
}

class(df$Evolution)
df$Evolution = as.character(df$Evolution)

# df$EvolutionBis = as.numeric(gsub("%","",as.character(df$Evolution)))  

df$cooler = sapply(df$Evolution, couleur)

maxi = max(df$CA, na.rm = T) + 1/4*max(df$CA, na.rm = T)
maxou = 1/maxi

ggplot(df, aes(x=reorder(RS_2018, -Ranking), CA, ymax = maxi, ymin = 0)) + 
  geom_bar(stat="identity", position="dodge", fill="#FFD700", color="black", width = 0.75) + 
  coord_flip() +
  theme(axis.title.y = element_text(family="arial", face="bold.italic", size=12)) + 
  labs(x = NULL) +
  ylab("Chiffre d'affaires (M???)")+
  theme(plot.title=element_text( hjust=0.5, vjust=0.5, face='bold')) +
  theme_economist(base_size = 8, base_family = "Verdana",
                  dkpanel = F, horizontal = F) + 
  geom_text(aes(label = CA), position = position_dodge(1),
            hjust = -0.3, size = 3.5, fontface=2) + 
  geom_text(aes(label = Evolution),
            hjust = -2.5, size = 3.5, color=df$cooler, fontface=4)+
  ggtitle("Chiffre d'affaires par Entreprise selon la filière produits gastronomiques\n en Millions d'euros  (Top 20) pour l'année 2018"
          , subtitle="Source: Semmaris")  



#############################Horticulture et décoration#######################################################



rfl = filter(rank, TypeFilère == "Horticulture et décoration")
# rfl = filter(rank, TypeFilère == "Fruits et légumes")
unique(rank$TypeFilère)

head(rfl)


rf12018 = rfl[,c(1,2,5,7)]

rf12018=add_column(rf12018, year = 2018)


names(rf12018)[2]="CA"

df = rf12018

df$year=as.factor(df$year)

df$CA=round(df$CA/1000000,2)

couleur <- function(x){
  if (x < 0) { y <- "red"}
  else {y <- "#006400"}
}

class(df$Evolution)
df$Evolution = as.character(df$Evolution)

# df$EvolutionBis = as.numeric(gsub("%","",as.character(df$Evolution)))  

df$cooler = sapply(df$Evolution, couleur)

maxi = max(df$CA, na.rm = T) + 1/4*max(df$CA, na.rm = T)
mimax = 1/maxi

ggplot(df, aes(x=reorder(RS_2018, -Ranking), CA, ymax = maxi, ymin = 0)) + 
  geom_bar(stat="identity", position="dodge", fill="pink", color="black", width = 0.75) + 
  coord_flip() +
  theme(axis.title.y = element_text(family="arial", face="bold.italic", size=12)) + 
  labs(x = NULL) +
  ylab("Chiffre d'affaires (M???)")+
  theme(plot.title=element_text( hjust=0.5, vjust=0.5, face='bold')) +
  theme_economist(base_size = 8, base_family = "Verdana",
                  dkpanel = F, horizontal = F) + 
  geom_text(aes(label = CA), position = position_dodge(1),
            hjust = -0.2, size = 3.5, fontface=2) + 
  geom_text(aes(label = Evolution),
            hjust = -3, size = 3.5, color=df$cooler, fontface=4)+
  ggtitle("Chiffre d'affaires par Entreprise selon la filière Horticulture et décoration\n en Millions d'euros  (Top 20) pour l'année 2018"
          , subtitle="Source: Semmaris")


#############################Produits carnés#######################################################




rfl = filter(rank, TypeFilère == "Produits carnés")
# rfl = filter(rank, TypeFilère == "Produits carnés")
unique(rank$TypeFilère)

head(rfl)


rf12018 = rfl[,c(1,2,5,7)]

rf12018=add_column(rf12018, year = 2018)


names(rf12018)[2]="CA"

df = rf12018

df$year=as.factor(df$year)

df$CA=round(df$CA/1000000,2)

couleur <- function(x){
  if (x < 0) { y <- "red"}
  else {y <- "#006400"}
}

class(df$Evolution)
df$Evolution = as.character(df$Evolution)

# df$EvolutionBis = as.numeric(gsub("%","",as.character(df$Evolution)))  

df$cooler = sapply(df$Evolution, couleur)

maxi = max(df$CA, na.rm = T) + 1/4*max(df$CA, na.rm = T)
mimax = 1/maxi

ggplot(df, aes(x=reorder(RS_2018, -Ranking), CA, ymax = maxi, ymin = 0)) + 
  geom_bar(stat="identity", position="dodge", fill="red", color="black", width = 0.75) + 
  coord_flip() +
  theme(axis.title.y = element_text(family="arial", face="bold.italic", size=12)) + 
  labs(x = NULL) +
  ylab("Chiffre d'affaires (M???)")+
  theme(plot.title=element_text( hjust=0.5, vjust=0.5, face='bold')) +
  theme_economist(base_size = 8, base_family = "Verdana",
                  dkpanel = F, horizontal = F) + 
  geom_text(aes(label = CA), position = position_dodge(1),
            hjust = -0.2, size = 3.5, fontface=2) + 
  geom_text(aes(label = Evolution, group=year),
            hjust = -3, size = 3.5, color=df$cooler, fontface=4)+
  ggtitle("Chiffre d'affaires par Entreprise selon la filière produits carnés en Millions d'euros  (Top 20) pour l'année 2018"
          , subtitle="Source: Semmaris") 




#############################Activité de services#######################################################





rfl = filter(rank, TypeFilère == "Activités de services")
# rfl = filter(rank, TypeFilère == "Fruits et légumes")
unique(rank$TypeFilère)

head(rfl)


rf12018 = rfl[,c(1,2,5,7)]

rf12018=add_column(rf12018, year = 2018)


names(rf12018)[2]="CA"

df=rbind(rf12018,rf12017)

df=rf12018

df$year=as.factor(df$year)

df$CA=round(df$CA/1000000,2)

df[df$year=='2017', 4]

df$CA2 <- df$CA
df$CA2[df$year==2017]=""
df$Evolution[df$year==2017]=""

df[df$year==2018,]

maxi = max(df$CA, na.rm = T) + 1/6*max(df$CA, na.rm = T)
mimax = 1/maxi

ggplot(df, aes(x=reorder(RS_2018, -Ranking), CA, ymax = maxi, ymin = 0)) + 
  geom_bar(stat="identity", position="dodge", color="black", fill="#B8860B", width = 0.75) + 
  coord_flip() +
  theme(axis.title.y = element_text(family="arial", face="bold.italic", size=12)) + 
  labs(x = NULL) +
  ylab("Chiffre d'affaires (M???)")+
  theme(plot.title=element_text( hjust=0.5, vjust=0.5, face='bold')) +
  theme_economist(base_size = 8, base_family = "Verdana",
                  dkpanel = F, horizontal = F) + 
  geom_text(aes(label = CA), position = position_dodge(1),
            hjust = -0.2, size = 3.5, fontface=2) + 
  ggtitle("Chiffre d'affaires par Entreprise selon la filière Activités de services\n en Millions d'euros  (Top 20) pour l'année 2018"
          , subtitle="Source: Semmaris") +
  theme(plot.margin=unit(c(1,1,1,1),"cm"), legend.position=c(0, 0),
        legend.direction="horizontal", legend.title = element_blank())

