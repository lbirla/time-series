install.packages("forecast")
library("forecast")

#SINGLE EXPONENTIAL SMOOTHING
data=read.csv(choose.files(),header = TRUE)
data
mydata=data[-(12:72),2]
mydata
mydata_ts=ts(mydata)
mydata_ts
plot(mydata_ts)

dataforecast=HoltWinters(mydata_ts,beta = FALSE, gamma = FALSE, l.start = 381.96)
dataforecast
plot(dataforecast)
summary(dataforecast)
dataforecast$fitted
dataforecast$SSE

dataforecast2= forecast(dataforecast, h=8)
dataforecast2
plot(dataforecast2)

dataforecast2$fitted

acf(dataforecast2$residuals, lag.max = 3, na.action = na.pass)

Box.test(dataforecast2$residuals,lag = 6,type = "Ljung-Box")
plot(dataforecast2$residuals)


