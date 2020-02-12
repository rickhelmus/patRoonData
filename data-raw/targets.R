devtools::load_all(".")
targets <- read.csv(system.file("data-raw", "targets.csv", package = "patRoonData"), stringsAsFactors = FALSE)
usethis::use_data(targets, overwrite = TRUE)
