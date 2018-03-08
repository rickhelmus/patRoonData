library(patRoon)

dataDir <- "~/werk/Vittorio/demo"
anaInfo <- generateAnalysisInfo(dataDir, fileTypes = "Bruker")

# data recalibration & export
setDAMethod(anaInfo, file.path(dataDir, "20180306-DA-pos.m"))
recalibrarateDAFiles(anaInfo)
exportDAFiles(anaInfo)

# trim files: only keep retention/mz ranges specified below
# rtRange <- "0:600"; mzRange <- "75:300"
rtRange <- c(0L, 600L); mzRange <- c(75L, 300)
for (anai in seq_len(nrow(anaInfo)))
{
    mzML <- file.path(anaInfo$path[anai], paste0(anaInfo$analysis[anai], ".mzML"))
    mzMLOut <- file.path(anaInfo$path[anai], paste0(anaInfo$analysis[anai], "-compr.mzML"))
    # BUG: OpenMS seems to botch MS/MS precursor mz values (at least when loading processed files with mzR)
    # system2("FileFilter", c("-in", mzML, "-rt", rtRange, "-mz", mzRange, "-out", mzMLOut))
    # pwiz seems to work though...
    system2("msconvert", sapply(c(mzML, "--filter", sprintf("scanTime [%d,%d]", rtRange[1], rtRange[2]),
                                  "--filter", sprintf("mzWindow [%d,%d]", mzRange[1], mzRange[2]),
                                  "--outfile", mzMLOut), shQuote))
}

# simplify sample names
simplAnaNames <- sub("20180305-ECROS_STD_10_", "standard-", anaInfo$analysis)
simplAnaNames <- sub("20180305-solvent_A_([0-9])", "solvent-\\1", simplAnaNames)
simplAnaNames <- sub("-[0-9]+-pos[A-Za-z0-9_\\-]+", "", simplAnaNames)
simplAnaNames <- paste0(simplAnaNames, "-", rep(seq_len(3), 2))

file.rename(file.path(anaInfo$path, paste0(anaInfo$analysis, "-compr.mzML")),
            file.path(anaInfo$path, paste0(simplAnaNames, ".mzML")))
