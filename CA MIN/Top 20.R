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

rf12017 = rfl[,c(1,3,5)]

rf12017$Evolution <- NA

rf12017=add_column(rf12017, year = 2017)

names(rf12017)[2]="CA"
names(rf12018)[2]="CA"

df=rbind(rf12018,rf12017)
df$year=as.factor(df$year)

df$CA=round(df$CA/1000000,2)

df[df$year=='2017', 4]

df$CA2 <- df$CA
df$CA2[df$year==2017]=""
df$Evolution[df$year==2017]=""

df[df$year==2018,]

maxi = max(df$CA, na.rm = T) + 50

ggplot(df, aes(x=reorder(RS_2018, -Ranking), CA, fill = year, ymax = maxi, ymin = 0)) + 
  geom_bar(stat="identity", position="dodge", color="black", width = 0.75) + 
  coord_flip() +
  theme(axis.title.y = element_text(family="arial", face="bold.italic", size=12)) + 
  labs(x = NULL) +
  ylab("Chiffre d'affaires (M???)")+
  theme(plot.title=element_text( hjust=0.5, vjust=0.5, face='bold')) +
  theme_economist(base_size = 8, base_family = "Verdana",
                        dkpanel = F, horizontal = F) + 
  geom_text(aes(label = CA2, group = year), position = position_dodge(1),
  hjust = -0.3, size = 3.5, fontface=2) + 
  geom_text(aes(label = Evolution, group=year),
            hjust = -2.2, size = 3.5, color="red", fontface=4)+
  ggtitle("Chiffre d'affaires par Entreprise selon la filière Fruits et légumes\n en Millions d'euros  (Top 20)"
          , subtitle="Source: Semmaris") +
  theme(plot.margin=unit(c(1,1,1,1),"cm"), legend.position=c(-0.15, 1.03),
        legend.direction="horizontal", legend.title = element_blank()) +
  scale_fill_brewer(palette="Set1") +
  scale_fill_brewer(palette="Spectral") + 
  scale_fill_manual(values = c("tan3", "seagreen4")) 



#############################Produits de la mer#######################################################





rfl = filter(rank, TypeFilère == "Produits de la mer")
# rfl = filter(rank, TypeFilère == "Fruits et légumes")


head(rfl)


rf12018 = rfl[,c(1,2,5,7)]

rf12018=add_column(rf12018, year = 2018)

rf12017 = rfl[,c(1,3,5)]

rf12017$Evolution <- NA

rf12017=add_column(rf12017, year = 2017)

names(rf12017)[2]="CA"
names(rf12018)[2]="CA"

df=rbind(rf12018,rf12017)
df$year=as.factor(df$year)

df$CA=round(df$CA/1000000,2)

df[df$year=='2017', 4]

df$CA2 <- df$CA
df$CA2[df$year==2017]=""
df$Evolution[df$year==2017]=""

df[df$year==2018,]

maxi = max(df$CA, na.rm = T) + 50

ggplot(df, aes(x=reorder(RS_2018, -Ranking), CA, fill = year, ymax = maxi, ymin = 0)) + 
  geom_bar(stat="identity", position="dodge", color="black", width = 0.75) + 
  coord_flip() +
  theme(axis.title.y = element_text(family="arial", face="bold.italic", size=12)) + 
  labs(x = NULL) +
  ylab("Chiffre d'affaires (M???)")+
  theme(plot.title=element_text( hjust=0.5, vjust=0.5, face='bold')) +
  theme_economist(base_size = 8, base_family = "Verdana",
                  dkpanel = F, horizontal = F) + 
  geom_text(aes(label = CA2, group = year), position = position_dodge(1),
            hjust = -0.3, size = 3.5, fontface=2) + 
  geom_text(aes(label = Evolution, group=year),
            hjust = -3, size = 3.5, color="red", fontface=4)+
  ggtitle("Chiffre d'affaires par Entreprise selon la filière Marée en Millions d'euros  (Top 20)"
          , subtitle="Source: Semmaris") +
  theme(plot.margin=unit(c(1,1,1,1),"cm"), legend.position=c(-0.15, 1.03),
        legend.direction="horizontal", legend.title = element_blank()) +
  scale_fill_brewer(palette="Set1") +
  scale_fill_brewer(palette="Spectral") + 
  scale_fill_manual(values = c("tan3", "deepskyblue")) 


#############################Produits laitiers #######################################################



rfl = filter(rank, TypeFilère == "Produits laitiers ")
# rfl = filter(rank, TypeFilère == "Fruits et légumes")
unique(rank$TypeFilère)

head(rfl)


rf12018 = rfl[,c(1,2,5,7)]

rf12018=add_column(rf12018, year = 2018)

rf12017 = rfl[,c(1,3,5)]

rf12017$Evolution <- NA

rf12017=add_column(rf12017, year = 2017)

names(rf12017)[2]="CA"
names(rf12018)[2]="CA"

df=rbind(rf12018,rf12017)
df$year=as.factor(df$year)

df$CA=round(df$CA/1000000,2)

df[df$year=='2017', 4]

df$CA2 <- df$CA
df$CA2[df$year==2017]=""
df$Evolution[df$year==2017]=""

df[df$year==2018,]

maxi = max(df$CA, na.rm = T) + 50

ggplot(df, aes(x=reorder(RS_2018, -Ranking), CA, fill = year, ymax = maxi, ymin = 0)) + 
  geom_bar(stat="identity", position="dodge", color="black", width = 0.75) + 
  coord_flip() +
  theme(axis.title.y = element_text(family="arial", face="bold.italic", size=12)) + 
  labs(x = NULL) +
  ylab("Chiffre d'affaires (M???)")+
  theme(plot.title=element_text( hjust=0.5, vjust=0.5, face='bold')) +
  theme_economist(base_size = 8, base_family = "Verdana",
                  dkpanel = F, horizontal = F) + 
  geom_text(aes(label = CA2, group = year), position = position_dodge(1),
            hjust = -0.2, size = 3.5, fontface=2) + 
  geom_text(aes(label = Evolution, group=year),
            hjust = -2, size = 3.5, color="red", fontface=4)+
  ggtitle("Chiffre d'affaires par Entreprise selon la filière produits laitiers en Millions d'euros  (Top 20)"
          , subtitle="Source: Semmaris") +
  theme(plot.margin=unit(c(1,1,1,1),"cm"), legend.position=c(-0.12, 1.03),
        legend.direction="horizontal", legend.title = element_blank()) +
  scale_fill_brewer(palette="Set1") +
  scale_fill_brewer(palette="Spectral")


#############################Produits traiteurs#######################################################




rfl = filter(rank, TypeFilère == "Produits traiteurs")
# rfl = filter(rank, TypeFilère == "Fruits et légumes")
unique(rank$TypeFilère)

head(rfl)


rf12018 = rfl[,c(1,2,5,7)]

rf12018=add_column(rf12018, year = 2018)

rf12017 = rfl[,c(1,3,5)]

rf12017$Evolution <- NA

rf12017=add_column(rf12017, year = 2017)

names(rf12017)[2]="CA"
names(rf12018)[2]="CA"

df=rbind(rf12018,rf12017)
df$year=as.factor(df$year)

df$CA=round(df$CA/1000000,2)

df[df$year=='2017', 4]

df$CA2 <- df$CA
df$CA2[df$year==2017]=""
df$Evolution[df$year==2017]=""

df[df$year==2018,]

maxi = max(df$CA, na.rm = T) + 1/4*max(df$CA, na.rm = T)
maxou = 1/maxi

ggplot(df, aes(x=reorder(RS_2018, -Ranking), CA, fill = year, ymax = maxi, ymin = 0)) + 
  geom_bar(stat="identity", position="dodge", color="black", width = 0.75) + 
  coord_flip() +
  theme(axis.title.y = element_text(family="arial", face="bold.italic", size=12)) + 
  labs(x = NULL) +
  ylab("Chiffre d'affaires (M???)")+
  theme(plot.title=element_text( hjust=0.5, vjust=0.5, face='bold')) +
  theme_economist(base_size = 8, base_family = "Verdana",
                  dkpanel = F, horizontal = F) + 
  geom_text(aes(label = CA2, group = year), position = position_dodge(1),
            hjust = -0.3, size = 3.5, fontface=2) + 
  geom_text(aes(label = Evolution, group=year),
            hjust = -4, size = 3.5, color="red", fontface=4)+
  ggtitle("Chiffre d'affaires par Entreprise selon la filière produits gastronomiques\n en Millions d'euros  (Top 20)"
          , subtitle="Source: Semmaris") +
  theme(plot.margin=unit(c(1,1,1,1),"cm"), legend.position=c(-0.12 + maxou, 1.03),
        legend.direction="horizontal", legend.title = element_blank()) +
  scale_fill_brewer(palette="Set1") +
  scale_fill_brewer(palette="Spectral") + 
  scale_fill_manual(values = c("orangered3", "yellow")) 



#############################Horticulture et décoration#######################################################



rfl = filter(rank, TypeFilère == "Horticulture et décoration")
# rfl = filter(rank, TypeFilère == "Fruits et légumes")
unique(rank$TypeFilère)

head(rfl)


rf12018 = rfl[,c(1,2,5,7)]

rf12018=add_column(rf12018, year = 2018)

rf12017 = rfl[,c(1,3,5)]

rf12017$Evolution <- NA

rf12017=add_column(rf12017, year = 2017)

names(rf12017)[2]="CA"
names(rf12018)[2]="CA"

df=rbind(rf12018,rf12017)
df$year=as.factor(df$year)

df$CA=round(df$CA/1000000,2)

df[df$year=='2017', 4]

df$CA2 <- df$CA
df$CA2[df$year==2017]=""
df$Evolution[df$year==2017]=""

df[df$year==2018,]

maxi = max(df$CA, na.rm = T) + 1/4*max(df$CA, na.rm = T)
mimax = 1/maxi

ggplot(df, aes(x=reorder(RS_2018, -Ranking), CA, fill = year, ymax = maxi, ymin = 0)) + 
  geom_bar(stat="identity", position="dodge", color="black", width = 0.75) + 
  coord_flip() +
  theme(axis.title.y = element_text(family="arial", face="bold.italic", size=12)) + 
  labs(x = NULL) +
  ylab("Chiffre d'affaires (M???)")+
  theme(plot.title=element_text( hjust=0.5, vjust=0.5, face='bold')) +
  theme_economist(base_size = 8, base_family = "Verdana",
                  dkpanel = F, horizontal = F) + 
  geom_text(aes(label = CA2, group = year), position = position_dodge(1),
            hjust = -0.2, size = 3.5, fontface=2) + 
  geom_text(aes(label = Evolution, group=year),
            hjust = -3, size = 3.5, color="red", fontface=4)+
  ggtitle("Chiffre d'affaires par Entreprise selon la filière Horticulture et décoration\n en Millions d'euros  (Top 20)"
          , subtitle="Source: Semmaris") +
  theme(plot.margin=unit(c(1,1,1,1),"cm"), legend.position=c(-0.17 + mimax, 1.03),
        legend.direction="horizontal", legend.title = element_blank()) +
  scale_fill_brewer(palette="Set1") +
  scale_fill_brewer(palette="Spectral") + 
  scale_fill_manual(values = c("gray50", "pink")) 


#############################Produits carnés#######################################################




rfl = filter(rank, TypeFilère == "Produits carnés")
# rfl = filter(rank, TypeFilère == "Produits carnés")
unique(rank$TypeFilère)

head(rfl)


rf12018 = rfl[,c(1,2,5,7)]

rf12018=add_column(rf12018, year = 2018)

rf12017 = rfl[,c(1,3,5)]

rf12017$Evolution <- NA

rf12017=add_column(rf12017, year = 2017)

names(rf12017)[2]="CA"
names(rf12018)[2]="CA"

df=rbind(rf12018,rf12017)
df$year=as.factor(df$year)

df$CA=round(df$CA/1000000,2)

df[df$year=='2017', 4]

df$CA2 <- df$CA
df$CA2[df$year==2017]=""
df$Evolution[df$year==2017]=""

df[df$year==2018,]

maxi = max(df$CA, na.rm = T) + 1/4*max(df$CA, na.rm = T)
mimax = 1/maxi

ggplot(df, aes(x=reorder(RS_2018, -Ranking), CA, fill = year, ymax = maxi, ymin = 0)) + 
  geom_bar(stat="identity", position="dodge", color="black", width = 0.75) + 
  coord_flip() +
  theme(axis.title.y = element_text(family="arial", face="bold.italic", size=12)) + 
  labs(x = NULL) +
  ylab("Chiffre d'affaires (M???)")+
  theme(plot.title=element_text( hjust=0.5, vjust=0.5, face='bold')) +
  theme_economist(base_size = 8, base_family = "Verdana",
                  dkpanel = F, horizontal = F) + 
  geom_text(aes(label = CA2, group = year), position = position_dodge(1),
            hjust = -0.2, size = 3.5, fontface=2) + 
  geom_text(aes(label = Evolution, group=year),
            hjust = -3, size = 3.5, color="red", fontface=4)+
  ggtitle("Chiffre d'affaires par Entreprise selon la filière produits carnés en Millions d'euros  (Top 20)"
          , subtitle="Source: Semmaris") +
  theme(plot.margin=unit(c(1,1,1,1),"cm"), legend.position=c(-0.11 + mimax, 1.03),
        legend.direction="horizontal", legend.title = element_blank()) +
  scale_fill_brewer(palette="Set1") +
  scale_fill_brewer(palette="Spectral") + 
  scale_fill_manual(values = c("blue", "red")) 




#############################Activité de services#######################################################





rfl = filter(rank, TypeFilère == "Activités de services")
# rfl = filter(rank, TypeFilère == "Fruits et légumes")
unique(rank$TypeFilère)

head(rfl)


rf12018 = rfl[,c(1,2,5,7)]

rf12018=add_column(rf12018, year = 2018)

rf12017 = rfl[,c(1,3,5)]

rf12017$Evolution <- NA

rf12017=add_column(rf12017, year = 2017)

names(rf12017)[2]="CA"
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

maxi = max(df$CA, na.rm = T) + 1/4*max(df$CA, na.rm = T)
mimax = 1/maxi

ggplot(df, aes(x=reorder(RS_2018, -Ranking), CA, fill = year, ymax = maxi, ymin = 0)) + 
  geom_bar(stat="identity", position="dodge", color="black", fill="goldenrod1", width = 0.75) + 
  coord_flip() +
  theme(axis.title.y = element_text(family="arial", face="bold.italic", size=12)) + 
  labs(x = NULL) +
  ylab("Chiffre d'affaires (M???)")+
  theme(plot.title=element_text( hjust=0.5, vjust=0.5, face='bold')) +
  theme_economist(base_size = 8, base_family = "Verdana",
                  dkpanel = F, horizontal = F) + 
  geom_text(aes(label = CA, group = year), position = position_dodge(1),
            hjust = -0.2, size = 3.5, fontface=2) + 
  ggtitle("Chiffre d'affaires par Entreprise selon la filière Activités de services\n en Millions d'euros  (Top 20)"
          , subtitle="Source: Semmaris") +
  theme(plot.margin=unit(c(1,1,1,1),"cm"), legend.position=c(0, 0),
        legend.direction="horizontal", legend.title = element_blank())

