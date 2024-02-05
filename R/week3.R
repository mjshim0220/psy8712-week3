#Script Settings and Recources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Data Import and Cleaning
raw_df<-read.csv("../data/week3.csv")
raw_df$timeStart<-as.POSIXct(raw_df$timeStart)
raw_df$timeEnd<-as.POSIXct(raw_df$timeEnd)
clean_df<-subset(raw_df, subset=!(timeStart<="2017-06-30"))
clean_df<-subset(clean_df, subset=(q6==1))
