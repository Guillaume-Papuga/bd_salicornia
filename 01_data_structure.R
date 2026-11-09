##############################################################"
#' Biodiv-data
#' Groupe salicornes 
#' Bonneaudet ; Fraboulet 
#' 2026-2027
#' ############################################################


#### 0. Préparation ####
library(openxlsx)
dir.create("data/data_clean")
# chemins relatifs à la racine du dépôt
dossier_clean <- file.path("data", "data_clean")
setwd(dir = "data/raw")
getwd()

#### Je rouvre l'ensemble des csv et tableaux ###

ge_dat <- read.csv(file = "general_data.csv",sep = ";", header = TRUE)

dat_topo <- read.csv(file = "raw_data_topo.csv",sep = ";", header = TRUE)#beaucoup de NA

coord_gps <- read.csv(file = "coord_gps.csv",sep = ";", header = TRUE)

data_sol_simpl <- read.xlsx("data_sol.xlsx", sheet = 5)

data_distance_sediment <- read.csv(file="data_distance_sediment.csv", sep=";" , header=TRUE)
