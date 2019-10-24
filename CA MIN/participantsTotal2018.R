library(tidyverse)

library(ggthemes)
library(extrafont)
library(plyr)
library(scales)

install.packages("extrafont")
library(extrafont)

download.file("http://simonsoftware.se/other/xkcd.ttf",dest="xkcd.ttf", mode="wb")
system("mkdir ~/.fonts")
system("cp xkcd.ttf  ~/.fonts")
font_import(paths = "~/.fonts", pattern="[X/x]kcd")
fonts()
loadfonts()

repons <- read.csv2("C:/Users/MELKI/Desktop/python/participantsTotal2018rep.csv", header=TRUE, sep=";", dec=".", encoding = "UTF-8")

repons = repons[repons$reponse=="repondu",]

str(reponse)

rep2=repons

names(rep2)[1]<-"Secteur"

rep <- ddply(rep2, .(Secteur),
                     transform, pos = cumsum(percent) - (0.5 * percent))


p4<-ggplot() + geom_bar(aes(y = percent, x = Secteur, fill = reponse), data = rep,
                          stat="identity")

p4 <- p4 + geom_text(data=rep, aes(x = Secteur, y = pos,label = paste0(percent,"%")), size=4)+
  ylab("pourcentage") + 
  theme(axis.text.x = element_text(angle = 10, hjust = 1 ,size = 10)) +
  theme(legend.position = "top") +
  theme(legend.title = element_blank(), legend.text=element_text(size=6.5))+
  ggtitle("Répondants à l'enquête CA 2018 (%)")+
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title=element_text(family="xkcd-Regular"), text=element_text(family="xkcd-Regular"),
        axis.text.x=element_text(colour="black", size = 10),
        axis.text.y=element_text(colour="black", size = 10))



ggplot() + geom_bar(aes(y = total, x = Secteur), data = rep,
                        stat="identity",fill = "#3895D3")+ 
  theme(axis.text.x = element_text(angle = 10, hjust = 1 ,size = 10)) +
  theme(legend.position = "top") +
  theme(legend.title = element_blank(), legend.text=element_text(size=6.5))+
  ggtitle("Répondants à l'enquête CA 2018")+
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title=element_text(family="xkcd-Regular"), text=element_text(family="xkcd-Regular"),
        axis.text.x=element_text(colour="black", size = 10),
        axis.text.y=element_text(colour="black", size = 10))+
  geom_text(data=rep, aes(x = Secteur, y = total,label = paste0(total)), vjust=-1, size=4)


install.packages("formattable")
library(formattable)
customRed = "#ff7f7f"

rep <- subset( rep, select = -5 )

names(rep)[3]<-"Pourcentage (%)"
names(rep)[4]<-"Total"


formattable(rep, align =c("l","c","c"), list(
  'Secteur' = formatter("span", style = ~ style(color = "grey",font.weight = "bold")), 
  'Pourcentage (%)' = color_bar(customRed)))




