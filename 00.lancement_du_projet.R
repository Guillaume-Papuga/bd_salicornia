setwd(dir = "data/raw")
getwd()

dat <- read.csv(file = "general_data.csv",sep = ";", header = TRUE)
dim(dat)
head(dat,10)
