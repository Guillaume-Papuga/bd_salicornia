##############################################################"
#' Biodiv-data
#' Groupe salicornes 
#' Bonneaudet ; Fraboulet 
#' 2026-2027
#'Exploration de la structure des données SALICORNE
#' ####################################################"

#' 01. Je charge les données nettoyées en csv créées dans 00
ge_dat <- read.csv("data/data_clean/general_data.csv", row.names = 1)
dat_topo <- read.csv("data/data_clean/raw_data_topo.csv", row.names = 1)
coord_gps <- read.csv("data/data_clean/coord_gps.csv", row.names = 1)
data_labo <- read.csv("data/data_clean/data_labo.csv", row.names = 1, check.names = FALSE)
data_sol_simpl <- read.csv("data/data_clean/data_sol_simpl.csv", row.names = 1)
data_distance_sediment <- read.csv("data/data_clean/data_distance_sediment.csv", row.names = 1)


#### 02. Global : tailles et NA 

# Taille : nombre de lignes, puis nombre de colonnes
dim(ge_dat)
dim(dat_topo)
dim(coord_gps)
dim(data_labo)
dim(data_sol_simpl)
dim(data_distance_sediment)

### 03. Pourcentage de NA dans chaque tableau
mean(is.na(ge_dat)) * 100
mean(is.na(dat_topo)) * 100  # là on a quand même 1/4 de NA sur  data_topo ! 
mean(is.na(coord_gps)) * 100
mean(is.na(data_labo)) * 100
mean(is.na(data_sol_simpl)) * 100  # Ici on a 17% de NA
mean(is.na(data_distance_sediment)) * 100

#Pour le reste c'est ok


#### 04. Valeurs manquantes (nombre de NA par colonne)
colSums(is.na(ge_dat))
colSums(is.na(dat_topo))  #manque ++ pour S_patula, fructicosa et A_macrostachyum
colSums(is.na(coord_gps))
colSums(is.na(data_labo))
colSums(is.na(data_sol_simpl)) ## delta_touffe_ZI ;  delta_ZI_A ;  delta_A_touffe
colSums(is.na(data_distance_sediment))

#### 05. Lignes en double
sum(duplicated(ge_dat))
sum(duplicated(dat_topo))
sum(duplicated(coord_gps))
sum(duplicated(data_labo))
sum(duplicated(data_sol_simpl))
sum(duplicated(data_distance_sediment))
#'aucune 

#### 06. Valeurs summary
summary(ge_dat)
summary(dat_topo)
summary(coord_gps)
summary(data_labo)
summary(data_sol_simpl)
summary(data_distance_sediment)

#### 07. Moda des variables quali= plan d'échantillonnage
table(data_labo$type, useNA = "ifany")  #HYPER EQUILIBRE YOUPI = 30 prélèvements pour les 3 rypes 
table(data_distance_sediment$id_secteur, useNA = "ifany")  # IDEM, équilibré avec 10 lignes par secteur

# 3 secteurs * 10 stations/points*3 types =90 observ°

###TROIS PRELEVEMENTS SUR UN MEME POINT = données pas indépendantes ? Pas bien compris, à discuter

