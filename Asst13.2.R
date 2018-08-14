COBRA.YTD2017 <- read.csv("E:/kamagyana/Computing/DARET/Assignments/COBRA-YTD2017.csv", stringsAsFactors=FALSE)
View(COBRA.YTD2017)
str(COBRA.YTD2017)
sum(is.na(COBRA.YTD2017))
crimedata <- COBRA.YTD2017
colnames(crimedata)[22] <- "longitude"
colnames(crimedata)[23] <- "lattitude"
colnames(crimedata)[19] <- "CrimeType"
colnames(crimedata)[21] <- "NeiPlgUnit"
library(lubridate)
crimedata$rpt_date <- mdy(crimedata$rpt_date)
crimedata$occur_date <- mdy(crimedata$occur_date)
crimedata$poss_date <- mdy(crimedata$poss_date)
crimedata$occur_time <- hms(crimedata$occur_time)
crimedata$poss_time <- hms(crimedata$poss_time)
numcrime <- cbind(crimedata[,c(2,22,23)])
str(numcrime)
cor(numcrime, method = "pearson", use = "complete.obs")
numcrime <- cbind(crimedata[,c(1,2,8,12,13,15,18,22,23)])
numcrime <- numcrime[,-5]
numcrime$MI_PRINX <- as.numeric(numcrime$MI_PRINX)
numcrime$beat <- as.numeric(numcrime$beat)
numcrime$MinOfucr <- as.numeric(numcrime$MinOfucr)
numcrime$dispo_code <- as.numeric(numcrime$dispo_code)
numcrime$loc_type <- as.numeric(numcrime$loc_type)
str(numcrime)
cor(numcrime, method = "pearson", use = "complete.obs")
crime <-as.data.frame(table(crimedata$CrimeType))
colnames(crime)[1] <- "Crime"
crime
crime[order(-crime$Freq),]
load("E:/kamagyana/Computing/DARET/R-code-submissions/Asst13.1.RData")
colnames(numcrime)
cov(numcrime)
cor(numcrime)
plot(numcrime)

