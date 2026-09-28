setwd(dir = "data/raw")
getwd()

dat <- read.csv(file = "general_data.csv",sep = ";", header = TRUE)
dim(dat)
head(dat,10)
system2("git", c("config", "--global", "user.name", "Hugo Bonnaudet"))
system2("git", c("config", "--global", "--get", "user.name"))
system2("git", c("config", "--global", "--get", "user.email"))


#pourquoi je peux toujours pas commit ?