setwd("/Users/nlabbe/github/ctrl2")
getwd()


csv <- "precios3.csv"
prices <- read.csv2(csv, header = TRUE, sep=";", stringsAsFactors=FALSE)
data <- prices

str(data)

#X=camanchaca, Y=AQUACHILE, Z=MULTIFOODS
fit <- lm(data$PRECIO.IGPA ~ data$PRECIO.X + data$PRECIO.Y + data$PRECIO.Z)
summary(fit)

C <- data.frame(data$PRECIO.IGPA, data$PRECIO.X, data$PRECIO.Y, data$PRECIO.Z)

#operar los dataframes
C$RETORNO.IGPA <- (data$PRECIO.IGPA)/(data$PRECIO.IGPA) -1
C$RETORNO.X <- (data$PRECIO.X)/(data$PRECIO.X) -1
C$RETORNO.Y <- (data$PRECIO.Y)/(data$PRECIO.Y) -1
C$RETORNO.Z <- (data$PRECIO.Z)/(data$PRECIO.Z) -1

#realizar la correlacion
cor(C)

library(ggplot2)
#graficar variables
qplot(data$PRECIO.IGPA, data$PRECIO.X)
qplot(data$PRECIO.IGPA, data$PRECIO.Y)
qplot(data$PRECIO.IGPA, data$PRECIO.Z)
