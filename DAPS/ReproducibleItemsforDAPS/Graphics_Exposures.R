
setwd("~/Desktop/ReproducibleItemsforDAPS")

### libraries

library(msm)
library(sandwich)
library(ggplot2)
library(foreign)
library(ggplot2)
library(MASS)
library(Hmisc)
library(reshape2)
library(pbkrtest)
library(lme4)
library(lmerTest)
library(nlme)
library(dplyr)
library(RColorBrewer)
library(rmcorr)
library(table1)
library(plyr)

## import data from cohort 2 only
ddat <- read.csv("~/Desktop/ReproducibleItemsforDAPS/DAPS_2Cohort.csv")

svg(filename="pm10vest_SVG.svg", 
    width=5, 
    height=4, 
    pointsize=12)
plot(ddat$log_vest_pm10 ~ ddat$season, main="Personal PM10 by Season", xlab="Season", ylab= "log(pm10)" )
dev.off()



svg(filename="pm10msp_SVG.svg", 
    width=5, 
    height=4, 
    pointsize=12)
plot(ddat$log_msp_pm10 ~ ddat$season, main="Stationary PM10 by Season", xlab="Season", ylab= "log(pm10)" )
dev.off()

svg(filename="no2vest_SVG.svg", 
    width=5, 
    height=4, 
    pointsize=12)
plot(ddat$log_vest_NO2 ~ ddat$season, main="Personal NO2 by Season", xlab="Season", ylab= "log(NO2)" )
dev.off()

svg(filename="no2stat_SVG.svg", 
    width=5, 
    height=4, 
    pointsize=12)
plot(ddat$log_stat_NO2 ~ ddat$season, main="Stationary NO2 by Season", xlab="Season", ylab= "log(NO2)" )
dev.off()


ddat$season2 <- revalue(ddat$season, c("summer"="1","fall"="2", "winter"= "3", "spring"="4"))

ddat$season2 <- as.numeric(ddat$season)

ddat$nicalert <- as.factor(ddat$nicalert)

svg(filename="nicalert_SVG.svg", 
    width=5, 
    height=4, 
    pointsize=12)
ggplot(ddat,aes(x=season2,group=nicalert,fill=nicalert,col=I("black")))+
  geom_histogram(position="dodge",alpha=0.8,binwidth=0.5) +
  xlab("Season")+
  ylab("Count")+
  scale_x_continuous(breaks=c(1,2,3,4),
                     labels=c("Summer", "Fall", "Winter", "Spring"))+
  scale_fill_manual(" Nicalert \n Value", values = c('chartreuse3','yellow','orange','red'))+
  labs(title = "Nicalert Values by Season")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  theme(plot.title=element_text(family="Times", face="bold", size=15)) 
dev.off()

svg(filename="endo_SVG.svg", 
    width=5, 
    height=4, 
    pointsize=12)
plot(ddat$endo_m3 ~ ddat$season, main="Endotoxin by Season", xlab="Season", ylab= "Endotoxin" )
dev.off()

svg(filename="gluc_SVG.svg", 
    width=5, 
    height=4, 
    pointsize=12)
plot(ddat$gluc_m3 ~ ddat$season, main="Glucan by Season", xlab="Season", ylab= "Glucan" )
dev.off()

svg(filename="ETSvest_SVG.svg", 
    width=5, 
    height=4, 
    pointsize=12)
plot(ddat$vest_ETS ~ ddat$season, main="ETS by Season", xlab="Season", ylab= "ETS" )
dev.off()

svg(filename="ETSmsp_SVG.svg", 
    width=5, 
    height=4, 
    pointsize=12)
plot(ddat$MSP_ETS ~ ddat$season, main="ETS by Season \n Stationary", xlab="Season", ylab= "ETS" )
dev.off()

svg(filename="brcvest_SVG.svg", 
    width=5, 
    height=4, 
    pointsize=12)
plot(ddat$vest_BrC ~ ddat$season, main="Brown Carbon by Season \n Vest", xlab="Season", ylab= "Brown Carbon" )
dev.off()

svg(filename="brcmsp_SVG.svg", 
    width=5, 
    height=4, 
    pointsize=12)
plot(ddat$MSP_BrC ~ ddat$season, main="Brown Carbon by Season \n Stationary", xlab="Season", ylab= "Brown Carbon" )
dev.off()

svg(filename="bcvest_SVG.svg", 
    width=5, 
    height=4, 
    pointsize=12)
plot(ddat$vest_BC ~ ddat$season, main="Black Carbon by Season \n Vest", xlab="Season", ylab= "Black Carbon" )
dev.off()
svg(filename="bcmsp_SVG.svg", 
    width=5, 
    height=4, 
    pointsize=12)
plot(ddat$MSP_BC ~ ddat$season, main="Black Carbon by Season \n Stationary", xlab="Season", ylab= "Black Carbon" )
dev.off()



