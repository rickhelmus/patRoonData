devtools::load_all(".")

suspectsPos <- read.csv(system.file("data-raw", "suspects-pos.csv", package = "patRoonData"), stringsAsFactors = FALSE)
suspectsNeg <- read.csv(system.file("data-raw", "suspects-neg.csv", package = "patRoonData"), stringsAsFactors = FALSE)

ISTDListPos <- read.csv(system.file("data-raw", "istds-pos.csv", package = "patRoonData"), stringsAsFactors = FALSE)
ISTDListNeg <- read.csv(system.file("data-raw", "istds-neg.csv", package = "patRoonData"), stringsAsFactors = FALSE)

usethis::use_data(suspectsPos, suspectsNeg, ISTDListPos, ISTDListNeg, overwrite = TRUE)
