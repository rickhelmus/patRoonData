library(patRoon)

for (pol in c("pos", "neg"))
{
    dataDir <- paste0("C:/Users/rick/OneDrive - UvA/patRoon/patRoonData20/", pol)
    anaInfo <- generateAnalysisInfo(dataDir, formats = "bruker")

    # data recalibration
    setDAMethod(anaInfo, file.path(dataDir, paste0("20210331-DA-", pol, ".m")))
    recalibrarateDAFiles(anaInfo)

    # export & trim files: only keep retention/mz ranges specified below
    rtRange <- c(0L, 600L); mzRange <- c(75L, 450L)
    convertMSFiles(anaInfo = anaInfo, from = "bruker", to = "mzML",
                   filters = c(sprintf("scanTime [%d,%d]", rtRange[1], rtRange[2]),
                               sprintf("mzWindow [%d,%d]", mzRange[1], mzRange[2])),
                   extraOpts = "-n", overWrite = TRUE)
    
    # simplify sample names
    simplAnaNames <- anaInfo$analysis
    simplAnaNames[grepl("blank", simplAnaNames, fixed = TRUE)] <- paste0("solvent-", pol, "-", 1:3)
    simplAnaNames[grepl("std", simplAnaNames, fixed = TRUE)] <- paste0("standard-", pol, "-", 1:3)

    file.rename(file.path(anaInfo$path, paste0(anaInfo$analysis, ".mzML")),
                file.path(anaInfo$path, paste0(simplAnaNames, ".mzML")))
}
