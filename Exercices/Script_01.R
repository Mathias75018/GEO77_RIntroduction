####################################################################
# This script is a training script for the GEO77 Course            #                                                             #
#                                                                  #                                                    #
# Author: Mathias Bellat                                           #
# Affiliation : Tübingen University                                #
# Creation date : 08/10/2022                                       #
# E-mail: mathias.bellat@uni-tubingen.de                           #
####################################################################


# 2.1 Load data ---------------------------------------------------------------

# Scan folder
list.files()

list.files(path = "./Data/", pattern = "\\.csv")

# Load from library
data(iris)

#Read a .txt delim file
sample_csv <- read.table("./Data/LUCAS-SOIL-2018.csv", header = TRUE, sep = ";")

#Read a .csv file
sample_txt <- read.delim("./Data/Soil_sample_location.txt", header = TRUE, sep = "")

ls()

# 2.1 Inspect data ---------------------------------------------------------------

# Load packages
install.packages("palmerpeguins")
library(palmerpenguins)
data("penguins")

str(penguins_raw)

head(penguins)

tail(penguins)

ncol(penguins)

nrow(penguins)

summary(penguins)

# 2.4 Remove and add data ---------------------------------------------------------------

penguins_removedcol <- penguins[ , ! names(penguins) %in% c("sex", "species")]
penguins_removedrow <- penguins[-c(1:100),]

add_row <- penguins[c(1:25),]
combined_row <- rbind(penguins_removedrow, add_row )

add_col <- penguins["sex"]
combined_col <- cbind(add_col, penguins_removedcol)

add_col <- as.data.frame(add_col[-c(1:25),]) 
combined_col <- cbind(add_col, penguins_removedcol)
merge <- merge(add_col, penguins_removedcol, by = "row.names", all = TRUE)  #it will merge together the two data set and keep the columns with no values

merge <- merge(sample_csv, sample_txt, by = "POINTID") # Here the data that are not cross validate are removed

rm(merge, add_col, add_row, penguins_removed, penguins_removedcol, penguins_removedrow, combined_col, combined_row)

#Nas values

is.na(penguins)

penguins_noNAs <- na.omit(penguins)

sum(is.na(penguins) == TRUE)

penguins_NAsZero <- penguins 
penguins_NAsZero[is.na(penguins_NAsZero)] = 0

levels(penguins$sex)   
summary(penguins$sex) 


penguins_NAsZero[is.na(penguins_NAsZero)] = "male"
summary(penguins_NAsZero$sex)
sum(is.na(penguins_NAsZero) == TRUE)


# 2.3 Variables  -----------------------------------------------------------------------


penguins$bill_length_mm
penguins$bill_length_mm > 50
sum(penguins$bill_length_mm > 50)
sum(penguins$bill_length_mm < 50)
sum(penguins$bill_length_mm == 50)

sum(penguins$bill_length_mm < 50 | penguins$bill_length_mm == 50)

penguins_big <- subset(penguins, penguins$bill_length_mm >50)  #Subset function to select the value feting the condition
penguins_big

penguins$species
summary(penguins$species)
penguins$species != "Adelie"

penguins_small_adelie <- subset(penguins, penguins$species == "Adelie" & penguins$bill_length_mm < 50)
penguins_small_adelie

#  The pipe system  -----------------------------------------------------------------------

install.packages("tidyverse")
library(tidyverse)

penguins_small_adeliebis <- penguins %>%  subset(species == "Adelie" & bill_length_mm < 50)

