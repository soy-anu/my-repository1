#import datasheet
library(readr)
responses <- read.csv("C:/Users/USER/Desktop/responses.csv")
View(responses)

#
attach(responses)

summary(Score) 

#test for normality
gghistogram(Score,bins = 10) #plot histogram

library(dplyr)
library(ggpubr)

ggdensity(Score,main="score of the students",xlab = "Score" ) #plot the density curve
shapiro.test(Score) #perform a shapiro-wilk test

#normalization
library(caret)
process <- preProcess(as.data.frame(Score), method = c("range"))
Score_N <- predict(process,as.data.frame(Score))
Score_N
summary(Score_N)

#grouping by score(poor,good,best)
attach(responses)
library(dplyr)
responses <- responses %>% group_by(group = cut(Score,c(-1,30,60,100),labels = c("poor","good","best")))
View(responses)

group_percent <- t(prop.table(table(responses$group))) *100
View(group_percent)
barplot(group_percent,ylab = "percent" ,col = "green",main = 'All volunteers' ,legend = c('poor=0-30','good=30-60','best>60'))

library(janitor)
df <- tabyl(responses,group)%>% adorn_pct_formatting(digits = 1)
View(df)


#Gender wise analysis
gender_group <- table(responses$Gender,responses$group)
gender_group
barplot(gender_group, beside = TRUE,legend=TRUE,ylim = c(0,250))


library(CGPfunctions)
PlotXTabs(responses,Score,Gender)

df1 <- data.frame(Score,Gender)
View(df1)
s1 <- split(df1,df1$Gender)
View(s1)

#gender-male
m <- s1[["Male"]]
View(m)
attach(m)
summary(m)
sd(Score) 

#normalize
process1 <- preProcess(as.data.frame(Score), method = c("range"))
Score_n1 <- predict(process1,as.data.frame(Score))
Score_n1
summary(Score_n1)
sapply(Score_n1,sd)
library(plotrix)
std.error(Score_n1)

#gender-female
f <- s1[["Female"]]
View(f)
attach(f)
summary(f)
sd(Score)

#normalize
library(caret)
process2 <- preProcess(as.data.frame(Score), method = c("range"))
Score_n2 <- predict(process2,as.data.frame(Score))
Score_n2
summary(Score_n2)
sapply(Score_n2,sd)
library(plotrix)
std.error(Score_n2)

#z-test
  
#null hypothesis:H0-there is no significant difference of knowledge on sexual education between male female
#alternative hypothesis:H1-there is significant difference of knowledge on sexual education between male female


library(BSDA)
z.test(x=Score_n1, y=Score_n2, mu=0 , sigma.x =0.1367189, sigma.y =0.1692168 )


#null hypothesis is true







#faculty wise analysis (medical/non_medical)
attach(responses)
df2 <- data.frame(Score,Faculty)
View(df2)
s2 <- split(df2,df2$Faculty)
View(s2)


#faculty-medical faculty
medical <- s2[["Faculty of Medicine"]]
attach(medical)
summary(medical)
sd(Score)



#normalize
library(caret)
process3 <- preProcess(as.data.frame(Score), method = c("range"))
Score_n3 <- predict(process3,as.data.frame(Score))
Score_n3
summary(Score_n3)
sapply(Score_n3,sd)
library(plotrix)
std.error(Score_n3)



#faculty-non medical faculties
non_medical <- rbind(s2[["Faculty of Agriculture and Plantation Management"]],s2[["Faculty of Applied sciences"]],s2[["Faculty of Business studies and Finance"]],s2[["Faculty of Livestock Fisheries and Nutrition"]],s2[["Faculty of Technology"]])
View(non_medical)
attach(non_medical)
summary(non_medical)
sd(Score)


#normalize
library(caret)
process4 <- preProcess(as.data.frame(Score), method = c("range"))
Score_n4 <- predict(process4,as.data.frame(Score))
Score_n4
summary(Score_n4)
sapply(Score_n4,sd)
library(plotrix)
std.error(Score_n4)



#z-test

#null hypothesis:H0-there is no significant difference of knowledge on sexual education between medical non medical
#alternative hypothesis:H1-there is significant difference of knowledge on sexual education between medical non medical


library(BSDA)
z.test(x=Score_n1, y=Score_n2, mu=0 , sigma.x =0.1612588 , sigma.y = 0.1500016)


#null hypothesis is true



