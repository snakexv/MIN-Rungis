library(tidyverse)
sed <- read.csv2("C:/Users/MELKI/Desktop/python/sedaparr.csv", header=TRUE, sep=";", dec=".", encoding = "UTF-8")



col(sed)

summary(sed)
str(sed)
class(sed)

sed$Cumul=as.double(sed$Cumul)

ggplot(sed, aes(x=RAISON_SOCIALE, y=Cumul)) +
  geom_bar(fill = "#0073C2FF", stat = "identity")+
  geom_text(aes(label = Cumul), vjust = -0.3)+
  xlab("Raison sociale") +
  ylab("Cumul en tonnes de mars 2019 à Juillet 2019") +
  theme(panel.background=element_blank())

p
