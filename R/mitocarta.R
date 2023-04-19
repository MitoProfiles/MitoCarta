# Downloading data

library(here)
library(readxl)
library(tidyverse)


## Set the path to mitocarta data (excel file)
mitocarta_path <- here("data-raw/Human.MitoCarta3.0.xls")

## Create list to save all mitocarta sheets
mitocarta_data <- list()

## Read each data sheet

# Specify the column type to avoid mistakes with reading in the data
a_hmitocarta_col_types <- c(rep("text", 10), rep("numeric", 3), rep("text", 3), rep("numeric", 2),
                            "text", rep("numeric", 2), rep("text", 4), rep("numeric", 7), "text",
                            rep("numeric", 14), "text")

# Sheet A Human MitoCarta3.0
mitocarta_data$A_Human_MitoCarta3 <- read_xls(mitocarta_path,
                                              sheet = "A Human MitoCarta3.0",
                                              col_names = TRUE,
                                              col_types = a_hmitocarta_col_types,
                                              na = c("NA", ""))
# Sheet B Human All Genes
mitocarta_data$B_Human_All_Genes <- read_xls(mitocarta_path,
                                             sheet = "B Human All Genes",
                                             col_names = TRUE,
                                             col_types = a_hmitocarta_col_types,
                                             na = c("NA", ""))
# Sheet C MitoPathways
mitocarta_data$C_MitoPathways <- read_xls(mitocarta_path,
                                          sheet = "C MitoPathways",
                                          col_names = TRUE,
                                          col_types = "text",
                                          na = c("NA", ""))

mitocarta_data$C_MitoPathways %>%
  select(2:4) -> mitocarta_data$C_MitoPathways # WORKAROUND to discard empty columns


# Remove all "NA" rows
mitocarta_data$A_Human_MitoCarta3 %>%
  filter(., rowSums(is.na(.)) != ncol(.)) -> mitocarta_data$A_Human_MitoCarta3

mitocarta_data$B_Human_All_Genes %>%
  filter(., rowSums(is.na(.)) != ncol(.)) -> mitocarta_data$B_Human_All_Genes

mitocarta_data$C_MitoPathways %>%
  filter(., rowSums(is.na(.)) != ncol(.)) -> mitocarta_data$C_MitoPathways




## Save the mitocarta data
save(mitocarta_data, file = "mitocarta.RData")

usethis::use_data(mitocarta_data, overwrite = TRUE)
