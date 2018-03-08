targets <- read.csv(system.file("data-raw", "targets.csv", package = "patRoonData"), stringsAsFactors = FALSE)
devtools::use_data(targets)
