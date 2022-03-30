rm(list = ls())
cat('\014')
CalcResistivity <- function(FName, h=1e-3, d=4e-3, label="Default", trim=99){
  data = read.table(file=FName)
  names(data) = c('time','USample',"ISense")
  RRef = 5
  
  IRef = (data$ISense/RRef)[(length(data$ISense)/trim):length(data$ISense)]
  URef = (data$USample)[(length(data$USample)/trim):length(data$USample)]/1000

  Raster = 2.54e-3
  n = 7
  l = Raster*n
  
  R = URef/IRef
  G=l/(R*h*d)
  plot(x=IRef, y = R)

  dexport = cbind.data.frame(data$time, data$ISense, data$ISense/RRef, data$USample)
  names(dexport) <- c("time", "ISense [mV]", "Current [A]", "USample [mV]")
  write.csv(file = paste(label, ".csv", sep = ''), x = dexport, dec = '.', sep = ',')
  
  print(max(IRef))
  summ = data.frame(label, mean(G), min(G), max(G), median(G), sd(G))
  return(summ)
}

res = CalcResistivity(FName = "Cu-M_3.dat", label = "Cu_1")
res = rbind(res, CalcResistivity(FName = "Cu-M_4.dat", h=0.85e-3, d=4.02e-3, label = "Cu_2"))
res = rbind(res, CalcResistivity(FName = "Cu-M_5.dat", h=0.85e-3, d=4.02e-3, label = "Cu_3"))
res = rbind(res, CalcResistivity(FName = "Cu-M_7.dat", h=0.85e-3, d=4.02e-3, label = "Cu_4"))
res = rbind(res, CalcResistivity(FName = "Cu-M_8.dat", h=0.85e-3, d=4.02e-3, label = "Cu_5"))
res = rbind(res, CalcResistivity(FName = "Cu-M_9.dat", h=0.85e-3, d=4.02e-3, label = "Cu_6"))

#write.csv(res, file="20220311_Cu-Electrical")

