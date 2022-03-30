#plot
cat('\014')
library(ggplot2)
library(xtable)

data = read.csv(file="20220311_Cu-Electrical.csv")

G1 = ggplot(data, aes(x=label, y=mean..S.m.))+
  geom_bar(stat='identity')+
  geom_errorbar(aes(ymin=data$mean..S.m.-data$sd..S.m., ymax=data$mean..S.m.+data$sd..S.m., width=.5))+
  ggtitle(label = "Przewodnictwo elektryczne", subtitle = "T019: 20220311")+
  xlab("Próbka")+ylab("Przewodnictwo elektryczne [S/m]")+
  theme_bw()

ggsave("T019-CuElectrical.png", width = 12, height = 10, units = 'cm')

print(G1)

expdata = data.frame(data$label, 
                     formatC(data$mean..S.m., format = 'e', digits = 2), 
                     formatC(data$median..S.m., format = 'e', digits = 2), 
                     formatC(data$sd..S.m., format = 'e', digits = 3))
names(expdata) <- c('LP', "Średnia [S/m]", "Mediana [S/m]", "Odchylenie standardowe [S/m[")
xtable(expdata)
