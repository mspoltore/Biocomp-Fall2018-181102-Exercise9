# BioComputing Exercise 9

rm(list=ls())
setwd("~/Desktop/biocomp2018/exercise9/Biocomp-Fall2018-181102-Exercise9")
data=read.csv("data.txt", header = TRUE, stringsAsFactors = FALSE)

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


