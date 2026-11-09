##############################################################"
#' Biodiv-data
#' Groupe salicornes 
#' Bonneaudet ; Fraboulet 
#' 2026-2027
#' ############################################################

#### Je rouvre l'ensemble des csv et tableaux créés dans 00 ###

ge_dat <- read.csv("data/data_clean/general_data.csv", row.names = 1)
dat_topo <- read.csv("data/data_clean/raw_data_topo.csv", row.names = 1)
coord_gps <- read.csv("data/data_clean/coord_gps.csv", row.names = 1)
data_labo <- read.csv("data/data_clean/data_labo.csv", row.names = 1, check.names = FALSE)
data_sol_simpl <- read.csv("data/data_clean/data_sol_simpl.csv", row.names = 1)
data_distance_sediment <- read.csv("data/data_clean/data_distance_sediment.csv", row.names = 1)
