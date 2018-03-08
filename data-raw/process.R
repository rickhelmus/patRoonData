library(patRoon)

dataDir <- "~/werk/Vittorio/demo"
anaInfo <- generateAnalysisInfo(dataDir)

# data recalibration & export
setDAMethod(anaInfo, file.path(dataDir, "20180306-DA-pos.m"))
recalibrarateDAFiles(anaInfo)
exportDAFiles(anaInfo)

# trim files: only keep retention/mz ranges specified below
rtRange <- "0:600"; mzRange <- "75:250"
for (anai in seq_len(nrow(anaInfo)))
{
    mzML <- file.path(anaInfo$path[anai], paste0(anaInfo$analysis[anai], ".mzML"))
    mzMLOut <- file.path(anaInfo$path[anai], paste0(anaInfo$analysis[anai], "-compr.mzML"))
    system2("FileFilter", c("-in", mzML, "-rt", rtRange, "-mz", mzRange, "-out", mzMLOut))
}

# simplify sample names
simplAnaNames <- sub("20180305-ECROS_STD_10_", "standard-", anaInfo$analysis)
simplAnaNames <- sub("20180305-solvent_A_([0-9])", "solvent-\\1", simplAnaNames)
simplAnaNames <- sub("-[0-9]+-pos[A-Za-z0-9_\\-]+", "", simplAnaNames)
simplAnaNames <- paste0(simplAnaNames, "-", rep(seq_len(3), 2))

file.rename(file.path(anaInfo$path, paste0(anaInfo$analysis, "-compr.mzML")),
            file.path(anaInfo$path, paste0(simplAnaNames, ".mzML")))
