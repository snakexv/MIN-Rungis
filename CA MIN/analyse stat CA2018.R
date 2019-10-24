library(tidyverse)
ca2018 <- read.csv2("C:/Users/MELKI/Desktop/python/analyse stat CA2018.csv", header=TRUE, sep=";", dec=".", encoding = "UTF-8")
ca2017 <- read.csv2("C:/Users/MELKI/Desktop/python/analyse stat CA2017bis.csv", header=TRUE, sep=";", dec=".", encoding = "UTF-8")

library(ggthemes)

col(ca2017)
col(ca2018)

summary(ca2018)
summary(ca2017)

str(ca2018)
str(ca2017)

class(ca2018)
class(ca2017)

ggplot(data=ca2018) +
    geom_bar(mapping=aes(x=Secteur, fill=Filiere)) +
    theme(legend.position = "top") +
    theme(legend.title = element_blank(), legend.text=element_text(size=6.5))

ggplot(data=ca2017) +
  geom_bar(mapping=aes(x=Secteur, fill=Filiere)) +
  theme(legend.position = "top") +
  theme(legend.title = element_blank(), legend.text=element_text(size=6.5))

ggplot(ca2018, aes(x=Secteur, y=CaMin)) +
  geom_bar(fill = "#0073C2FF", stat = "identity")


x = ca2018 %>% 
  group_by(Secteur) %>% 
  summarise(CaMin = sum(CaMin, na.rm=T))

v = ca2017 %>% 
  group_by(Secteur) %>% 
  summarise(CaMin = sum(CaMin, na.rm=T))

ggplot(x, aes(x=Secteur, y=CaMin)) +
  geom_bar(fill = "#0073C2FF", stat = "identity") +
  geom_text(aes(label = CaMin ), vjust = -0.3) +  
  xlab("") +
  ylab("CA Min 2018") + 
  theme(axis.text.x = element_text(angle = 10, hjust = 1 ,size = 10))

ggplot(v, aes(x=Secteur, y=CaMin)) +
  geom_bar(fill = "#0073C2FF", stat = "identity") +
  geom_text(aes(label =CaMin ), vjust = -0.3) +  
  xlab("") +
  ylab("CA Min 2017") +
  theme(axis.text.x = element_text(angle = 10, hjust = 1 ,size = 10))

ex = ca2018 %>% 
  group_by(TypeFilere) %>% 
  summarise(EffectifTot = sum(round(EffectifTot,0), na.rm=T))

ex$Secteur[ex$Secteur=="Produits laitiers et avicoles, produits traiteurs"]="PLA"

ex$Secteur = as.character(ex$Secteur)

ex[is.na(ex[,"Secteur"]),"Secteur"]<-"PLA"
ex$Secteur = as.factor(ex$Secteur)


ev = ca2017 %>% 
  group_by(Secteur) %>% 
  summarise(EffectifTot = sum(round(EffectifTot,0), na.rm=T))

d = c("gray", "#008000", "red", "#71c7ec", "#107dac", "#7878ea", "orange")
d = rev(d)

#ex$Secteur = NA
install.packages("remotes")
library("remotes")
library("ggplot2")

## install.packages("extrafont")
library(extrafont)
loadfonts()
#install.packages("devtools")
devtools::install_github("Ryo-N7/tvthemes")
#install.packages("hrbrthemes")
library("hrbrthemes")
loadfonts()
import_simpsons()         ## "Akbar" font
import_theLastAirbender() ## "Slayer" font
import_rickAndMorty()     ## "Get Schwifty" font
import_roboto_condensed() ## "Roboto Condensed" Google Font import from hrbrthemes
import_titillium_web()    ## "Titillium Web" Google Font import from hrbrthemes
import_spongeBob()        ## "Some Time Later" font
import_cinzel()           ## "Cinzel" font to use with 'The Palettes of Ice & Fire'


mpg %>% 
  ggplot(aes(displ)) +
  geom_histogram(aes(fill = class), 
                 col = "black", size = 0.1,
                 binwidth = 0.1) +
  scale_fill_brooklyn99() +
  labs(title = "Do you know what it means to 'clap back', Raymond?",
       caption = "Pizza bagels? Pizza rolls? Pizza poppers? Pizzaritos? Pizza pockets?") +
  theme_brooklyn99(title.font = "Titillium Web",
                   text.font = "Calibri Light",
                   subtitle.size = 14)
# A explorer



ggplot(ex, aes(x=reorder(TypeFilere,EffectifTot), y=EffectifTot, ymax=max(EffectifTot)+500)) +
  geom_bar(fill = d, stat = "identity", width = 0.5)  +
  geom_text(aes(label = EffectifTot, fontface=2 ), vjust = 0.5, hjust = 2) +  
  xlab("") +
  ylab("Eff 2018") + 
  theme(axis.text.x = element_text(angle = 10, hjust = 1 ,size = 12)) + 
  theme_brooklyn99(title.font = "Cinzel",
                 text.font = "Cinzel",
                 axis.text.size = 8) + coord_flip()+
  ggtitle("ETP par filière sur le marché de Rungis en 2018"
          , subtitle="Source: Département de la Semmaris")+ 
  labs(x = NULL) +
  ylab(NULL) 


# A explorer


ggplot(ev, aes(x=Secteur, y=EffectifTot)) +
  geom_bar(fill = "#0073C2FF", stat = "identity") +
  geom_text(aes(label =EffectifTot ), vjust = -0.3) +  
  xlab("") +
  ylab("Eff 2017") +
  theme(axis.text.x = element_text(angle = 10, hjust = 1 ,size = 10))

data2018 = ca2018 %>% 
  group_by(Secteur) %>%
  summarise(counts = n())

data2018=add_column(data2018, year = 2018)

data2017 = ca2017 %>% 
  group_by(Secteur) %>%
  summarise(counts = n())

data2017=add_column(data2017, year = 2017)

df=rbind(data2018,data2017)
df$year=as.factor(df$year)

ggplot(df, aes(Secteur, counts)) +
  geom_bar(aes(color=year, fill=year), stat = "identity", position = position_dodge(0.8), width = 0.7) +  
  scale_color_manual(values = c("#0073C2FF", "#EFC000FF"))+ geom_text(
    aes(label = counts, group = year), 
    position = position_dodge(0.8),
    vjust = -0.3, size = 3.5)+
  theme(axis.text.x = element_text(angle = 10, hjust = 1 ,size = 10))


a = ca2018 %>% 
  group_by(Secteur, Annee) %>% 
  summarise(CaMin = sum(CaMin, na.rm=T),EffectifTot = sum(EffectifTot, na.rm =T))

a$CaMin=round(a$CaMin/1000000,0)
a$EffectifTot=round(a$EffectifTot,0)

b = ca2017 %>% 
  group_by(Secteur, Annee) %>% 
  summarise(CaMin = sum(CaMin, na.rm=T),EffectifTot = sum(EffectifTot, na.rm =T))

b$CaMin=round(b$CaMin/1000000,0)
b$EffectifTot=round(b$EffectifTot,0)

ab=rbind(a,b)
ab$Annee=as.factor(ab$Annee)

ggplot(ab, aes(Secteur, CaMin)) +
  geom_bar(aes(color=Annee, fill=Annee), stat = "identity", position = position_dodge(0.8), width = 0.7) +  
  scale_fill_manual(values = c("#1f78b4", "#b2df8a"))+ geom_text(
    aes(label = CaMin, group = Annee), 
    position = position_dodge(0.8),
    vjust = -0.3, size = 3.5)+
  theme(axis.text.x = element_text(angle = 10, hjust = 1 ,size = 10)) +  
  xlab("") +
  ylab("Chiffres d'affaires (M???)") +
  ggtitle("Chiffres d'affaires par secteur entre l'année 2017 et 2018")+
  theme(plot.title=element_text( hjust=0.5, vjust=0.5, face='bold'))


ggplot(ab, aes(Secteur, EffectifTot)) +
  geom_bar(aes(color=Annee, fill=Annee), stat = "identity", position = position_dodge(0.8), width = 0.7) +  
  scale_fill_manual(values = c("#E6AB02", "#66A61E"))+ geom_text(
    aes(label = EffectifTot, group = Annee), 
    position = position_dodge(0.8),
    vjust = -0.3, size = 3.5)+
  theme(axis.text.x = element_text(angle = 10, hjust = 1 ,size = 10)) +  
  xlab("") +
  ylab("Effectif total") +
  ggtitle("Effectif total sur le MIN par secteur entre l'année 2017 et 2018")+
  theme(plot.title=element_text( hjust=0.5, vjust=0.5, face='bold'))

ta = ca2018 %>% 
  group_by(Annee) %>% 
  summarise(CaMin = sum(CaMin, na.rm=T),EffectifTot = sum(EffectifTot, na.rm =T))

ta$CaMin=round(ta$CaMin/1000000,0)
ta$EffectifTot=round(ta$EffectifTot,0)

tb = ca2017 %>% 
  group_by(Annee) %>% 
  summarise(CaMin = sum(CaMin, na.rm=T),EffectifTot = sum(EffectifTot, na.rm =T))

tb$CaMin=round(tb$CaMin/1000000,0)
tb$EffectifTot=round(tb$EffectifTot,0)

tab=rbind(ta,tb)
tab$Annee=as.factor(tab$Annee)

ggplot(tab, aes(Annee, EffectifTot)) +
  geom_bar(aes(fill=Annee), stat = "identity", position = position_dodge(0.8), width = 0.7) +  
  scale_fill_manual(values = c("#E6AB02", "#66A61E"))+ geom_text(
    aes(label = EffectifTot, group = Annee), 
    position = position_dodge(0.8),
    vjust = -0.3, size = 3.5)+
  theme(axis.text.x = element_text(angle = 10, hjust = 1 ,size = 10)) +  
  xlab("") +
  ylab("Effectif total") +
  ggtitle("Effectif total sur le MIN entre l'année 2017 et 2018")+
  theme(plot.title=element_text( hjust=0.5, vjust=0.5, face='bold'))

ggplot(tab, aes(Annee, CaMin)) +
  geom_bar(aes(fill=Annee), stat = "identity", position = position_dodge(0.8), width = 0.7) +  
  scale_fill_manual(values = c("#1f78b4", "#b2df8a"))+ geom_text(
    aes(label = CaMin, group = Annee), 
    position = position_dodge(0.8),
    vjust = -0.3, size = 3.5)+
  theme(axis.text.x = element_text(angle = 10, hjust = 1 ,size = 10)) +  
  xlab("") +
  ylab("Chiffres d'affaires (M???)") +
  ggtitle("Chiffres d'affaires sur le MIN entre l'année 2017 et 2018")+
  theme(plot.title=element_text( hjust=0.5, vjust=0.5, face='bold'))

head(ca2018)
ca2018$CaMinETP=round((ca2018$CaMin/ca2018$EffectifTot)/1000,2)
min(ca2018$CaMinETP,na.rm=T)

ca2017$CaMinETP=round((ca2017$CaMin/ca2017$EffectifTot)/1000,2)
min(ca2017$CaMinETP,na.rm=T)

install.packages("imputeTS")
library(imputeTS)

etp2018 = data.frame(ca2018$Secteur,ca2018$Annee,ca2018$CaMinETP)
names(etp2018)[1]<-"Secteur"
names(etp2018)[2]<-"Annee"
names(etp2018)[3]<-"CaMinETP"
head(etp2018)

etp2017 = data.frame(ca2017$Secteur,ca2017$Annee,ca2017$CaMinETP)
head(etp2017)
names(etp2017)[1]<-"Secteur"
names(etp2017)[2]<-"Annee"
names(etp2017)[3]<-"CaMinETP"

etp = rbind(etp2018,etp2017)
etp=na.omit(etp)
etp$Annee = as.factor(etp$Annee)
summary(etp)
str(etp)
etpmax <- etp$CaMinETP==max(etp$CaMinETP)
etp[etpmax,]


head(sort(etp$CaMinETP,decreasing=T))



etplimit <- etp$CaMinETP<2000
letp = etp[etplimit,]

summary(letp)

etpmean = letp  %>%
  group_by(Secteur, Annee) %>%
  summarise(
    mean_etp = mean(CaMinETP))

etpreel = etp  %>%
  group_by(Secteur, Annee) %>%
  summarise(
    mean_etp = mean(CaMinETP),min_etp = min(CaMinETP), max_etp = max(CaMinETP))

letpreel = letp  %>%
  group_by(Secteur, Annee) %>%
  summarise(
    mean_etp = mean(CaMinETP),min_etp = min(CaMinETP), max_etp = max(CaMinETP))

library(plotly)
library(htmlwidgets)
saveWidget(ggplotly(p), file = "test.html")

p = ggplot(etp, aes(x = Secteur, y = CaMinETP, fill=Annee)) +
  geom_boxplot(alpha=0.7) + 
  scale_y_continuous(name = "CA / ETP (k???)", limits=c(0, 2000))+
  theme(axis.text.x = element_text(angle = 10, hjust = 1 ,size = 10)) +  
  xlab("") +
  ggtitle("Fourchette des chiffres d'affaires par rapport à l'effectif sur le Min par secteur") +
  theme_bw() +
  theme(plot.title = element_text(size = 12, family = "Tahoma", face = "bold"),
        text = element_text(size = 12, family = "Tahoma"),
        axis.text.x = element_text(angle = 10, hjust = 1 ,size = 10)) +
  stat_summary(fun.y = mean, aes(group=Annee),position=position_dodge(.9), colour="red", geom="point", 
               shape=18, size=3, show_guide = FALSE) + 
  geom_text(data = etpmean, aes(label = round(mean_etp,0), y = mean_etp, vjust = -0.6, group=Annee)
            ,position=position_dodge(.9)) +  
  guides(shape=guide_legend(title=NULL, override.aes = list(alpha = 1))) + 
  guides(fill=guide_legend(title=NULL)) + theme(legend.position="top") + 
  geom_point(aes(shape = "Moyenne"), alpha = 0, colour="red")


install.packages("formattable")
library(formattable)
customRed = "#ff7f7f"

etpreel$mean_etp = round(etpreel$mean_etp,2)
names(etpreel)[3]<-"Moyenne CA/ETP"
names(etpreel)[4]<-"Minimum CA/ETP"
names(etpreel)[5]<-"Maximum CA/ETP"

formattable(etpreel, align =c("l","c","c","c","c"), list(
  'Secteur' = formatter("span", style = ~ style(color = "grey",font.weight = "bold")), 
  'Moyenne CA/ETP' = color_bar(customRed)))



letpreel$mean_etp = round(letpreel$mean_etp,2)
names(letpreel)[3]<-"Moyenne CA/ETP"
names(letpreel)[4]<-"Minimum CA/ETP"
names(letpreel)[5]<-"Maximum CA/ETP"

formattable(letpreel, align =c("l","c","c","c","c"), list(
  'Secteur' = formatter("span", style = ~ style(color = "grey",font.weight = "bold")), 
  'Moyenne CA/ETP' = color_bar(customRed)))










