library(tidyverse)
ca2018 <- read.csv2("C:/Users/MELKI/Desktop/python/analyse stat CA2018.csv", header=TRUE, sep=";", dec=".", encoding = "UTF-8")

library(ggthemes)


col(ca2018)
summary(ca2018)
str(ca2018)

nbcol(ca2018)

class(ca2018)
ca2018 <- tibble(ca2018)
head(ca2018)


ca2018 <- ca2018 %>% 
  mutate(CAEff = round((CaMin/EffectifTot)/1000,2))

summary(ca2018[(ca2018$CAEff>920) & (ca2018$CAEff<3000000), 58])

d = c("gray", "#008000", "red", "#71c7ec", "#107dac", "#7878ea", "orange")
d = rev(d)

ggplot(ca2018, aes(x=reorder(TypeFilere,CAEff), y=CAEff)) +
  geom_bar(fill = d, stat = "identity", width = 0.5) +
  theme(legend.position = "top") +
  theme(legend.title = element_blank(), legend.text=element_text(size=6.5))


