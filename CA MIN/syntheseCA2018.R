library(tidyverse)
synthese <- read.csv2("C:/Users/MELKI/Desktop/python/syntheseCA2018.csv", header=TRUE, sep=";", dec=".", encoding = "UTF-8")


library("hrbrthemes")
library(extrafont)
loadfonts()

fonts()
font_import(prompt = TRUE)
fonts()



names(synthese)[1]="Filiere"

Camin1=round(synthese$CaMin2018/1000000,2)
Camin2=round(synthese$CaMin2017/1000000,2)

synthese2018 = data_frame(synthese$Filiere, Camin1)
synthese2017 = data_frame(synthese$Filiere, Camin2)

synthese2017=add_column(synthese2017, year = 2017)
synthese2018=add_column(synthese2018, year = 2018)

names(synthese2017)[1]="Filiere"
names(synthese2017)[2]="CaMin"

names(synthese2018)[1]="Filiere"
names(synthese2018)[2]="CaMin"

df=rbind(synthese2018,synthese2017)
df$year=as.factor(df$year)

ggplot(df, aes(Filiere, CaMin)) +
  geom_bar(aes(color=year, fill=year), stat = "identity", position = position_dodge(0.8), width = 0.7) +  
  scale_color_manual(values = c("#E6AB02", "#66A61E"))+ geom_text(family = "Cinzel",
    aes(label = CaMin, group = year), 
    position = position_dodge(0.8),
    vjust = -0.3, size = 3.5)+
  theme(axis.text.x = element_text(family = "Cinzel",angle = 10, hjust = 1 ,size = 10)) +
  ylab("Chiffre d'affaires (k???)")+
  theme_economist()

a = df %>% 
  group_by(year) %>% 
  summarise(CaMin = sum(CaMin, na.rm=T))

a$year=as.factor(a$year)

ggplot(a, aes(year, CaMin)) +
  geom_bar(aes(fill=year), stat = "identity", position = position_dodge(0.8), width = 0.7) +  
  scale_fill_manual(values = c("#E6AB02", "#66A61E"))+ geom_text(
    aes(label = round(CaMin,0), group = year), 
    position = position_dodge(0.8),
    vjust = -0.3, size = 3.5)+
  theme(axis.text.x = element_text(angle = 10, hjust = 1 ,size = 10)) +  
  xlab("") +
  ylab("Chiffre d'affaires (M???)") +
  ggtitle("Chiffre d'affaires sur le MIN entre l'année 2017 et 2018")+
  theme(plot.title=element_text( hjust=0.5, vjust=0.5, face='bold'))
