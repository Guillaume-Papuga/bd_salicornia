library(openxlsx)
setwd(dir = "data/raw")
getwd()

ge_dat <- read.csv(file = "general_data.csv",sep = ";", header = TRUE)
dim(ge_dat)
head(ge_dat,10)

dat_topo <- read.csv(file = "raw_data_topo.csv",sep = ";", header = TRUE)
dim(dat_topo)
head(dat_topo)

coord_gps <- read.csv(file = "coord_gps.csv",sep = ";", header = TRUE)

getSheetNames("data_alti.xlsx")
getSheetNames("data_sol.xlsx")
