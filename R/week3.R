#Script Settings and Recources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Data Import and Cleaning
raw_df<-read.csv("../data/week3.csv")
raw_df$timeStart<-as.POSIXct(raw_df$timeStart)
raw_df$timeEnd<-as.POSIXct(raw_df$timeEnd)
clean_df<-subset(raw_df, subset=!(timeStart<="2017-06-30"))
clean_df<-subset(clean_df, subset=(q6==1))

#Analysis
clean_df$timeSpent<-difftime(clean_df$timeEnd,clean_df$timeStart, units="secs")
hist(as.numeric(clean_df$timeSpent))
frequency_table_list<-lapply(clean_df[,5:14],table)
lapply(frequency_table_list, barplot)
sum(clean_df$q1>=clean_df$q2 & clean_df$q2 !=clean_df$q3)
for(i in 1:length(frequency_table_list)){
  print(barplot(frequency_table_list[[i]]))}