#### 0. Préparation ####
library(openxlsx)
dir.create("data/data_clean")
# chemins relatifs à la racine du dépôt
dossier_clean <- file.path("data", "data_clean")
setwd(dir = "data/raw")
getwd()


#### 1. Fichiers CSV ####
ge_dat <- read.csv(file = "general_data.csv",sep = ";", header = TRUE)
dim(ge_dat)
head(ge_dat,10)
write.csv(ge_dat, "../data_clean/general_data.csv")

dat_topo <- read.csv(file = "raw_data_topo.csv",sep = ";", header = TRUE)#beaucoup de NA
dim(dat_topo)
head(dat_topo)
write.csv(dat_topo, "../data_clean/raw_data_topo.csv")

coord_gps <- read.csv(file = "coord_gps.csv",sep = ";", header = TRUE)
write.csv(coord_gps, "../data_clean/coord_gps.csv")


#### 2. Données de sol issues du labo ####
data_labo <- read.xlsx("2401572 à 2401661 - FONDATION TOUR DU VALAT - RECAPITULATIF.xlsx")[-c(1:2),-2]#enlève les deux première lignes et la colonne numéro
head(data_labo)

id <- data_labo$LABORATOIRE.TEYSSIER

# point : chiffres, éventuellement suivis de _chiffres (711 ou 7_1)
point_txt <- sub("^point ([0-9]+(_[0-9]+)?) - .*", "\\1", id)

# on sépare le numéro de point et le sous-numéro (NA s'il n'y en a pas)
point <- as.numeric(sub("_.*", "", point_txt))

# type de prélèvement
type <- factor(sub("^point [0-9_]+ - ([^ ]+) .*", "\\1", id))

data_labo <- data.frame(point, type,
                        data_labo[, -1],
                        stringsAsFactors = FALSE,
                        check.names = FALSE)
View(data_labo)

write.csv(data_labo, "../data_clean/data_labo.csv")


#### 3. Données de sol (terrain) ####
getSheetNames("data_alti.xlsx")
getSheetNames("data_sol.xlsx")

#STOP CLEAN
# feuille 5 : données simplifiées
data_sol_simpl <- read.xlsx("data_sol.xlsx", sheet = 5)
write.csv(data_sol_simpl, "../data_clean/data_sol_simpl.csv")

# feuille 1 : distances aux sédiments
data_distance_sediment <- read.xlsx("data_sol.xlsx", sheet = 1, colNames =  FALSE)[-1,]
names(data_distance_sediment )[names(data_distance_sediment) == "touffe"] <- "distance_a_la_touffe"
names(data_distance_sediment )[1:6] <- c("id_secteur","id_station","id_gps","distance_a_la_touffe", "intermed", "annuelle")
data_distance_sediment <- data_distance_sediment[-1,]
write.csv(data_distance_sediment, "../data_clean/data_distance_sediment.csv")