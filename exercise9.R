# BioComputing Exercise 9

rm(list=ls())
setwd("~/Desktop/biocomp2018/exercise9/Biocomp-Fall2018-181102-Exercise9")

# Part 1
BMI=read.csv("BMI.txt", header = TRUE, stringsAsFactors = FALSE)

BMI$weightDiff=NA
BMI$BMIdiff=NA
for (i in 1:nrow(BMI)) {
  difference=BMI[i,3]-BMI[i,2]
  BMI[i,6]=difference
  bmiDiff=BMI[i,5]-BMI[i,4]
  BMI[i,7]=bmiDiff
}
head(BMI)
a=ggplot(data=BMI,aes(x=BMIdiff,y=weightDiff))
a+geom_point()+theme_classic()+stat_smooth(method="lm")

# Part 2
data=read.csv("data.txt", header = TRUE, stringsAsFactors = FALSE)

northData=(data[data$region == "north",2])
northMean = mean(northData)
eastData=(data[data$region == "east",2])
eastMean = mean(eastData)
southData=(data[data$region == "south",2])
southMean = mean(southData)
westData=(data[data$region == "west",2])
westMean = mean(westData)

dirMeans = data.frame(Region=c("northMean","southMean","eastMean","westMean"), Mean=c(northMean,southMean,eastMean,westMean))
dirMeans
means=c(northMean,southMean,eastMean,westMean)
b=ggplot(data=dirMeans, aes(x=Region,y=Mean))
b+geom_bar(stat="identity")

# Part 3

c=ggplot(data=data, aes(x=region, y=observations))
c + geom_jitter()

