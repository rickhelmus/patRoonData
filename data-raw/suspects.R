devtools::load_all(".")
suspectsPos <- read.csv(system.file("data-raw", "suspects-pos.csv", package = "patRoonData"), stringsAsFactors = FALSE)
suspectsNeg <- read.csv(system.file("data-raw", "suspects-neg.csv", package = "patRoonData"), stringsAsFactors = FALSE)
usethis::use_data(suspectsPos, suspectsNeg, overwrite = TRUE)
