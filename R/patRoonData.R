#' Test data for the patRoon package
#'
#' A small set of LC-HRMS data to test and demonstrate the functionality of patRoon.
#'
#' This package contains data files from (1) a standard mixture containing various polar contaminants and (2) a blank
#' solvent. Both were analysed in triplicate, using an Shimadzu Nexera UHPLC coupled to an high resolution quadrupole
#' time of flight instrument (Bruker maXis 4G Q-TOF) using positive and negative electrospray ionization.
#'
#' To reduce file sizes, the data has been filtered to only contain the first ten minutes of the chromatographic run
#' with \emph{m/z} 75-500. The complete data processing script can be
#' found in data-raw/process.R
#' 
#' @param polarity Either \code{"positive"} or \code{"negative"}.
#'
#' @name patRoonData
NULL

assertPolarity <- function(polarity)
{
    if (length(polarity) != 1 || !polarity %in% c("positive", "negative"))
        stop("polarity should be positive or negative", call. = FALSE)
}

#' @details \code{exampleDataPath} is a helper function that returns the file path of the example data.
#' @rdname patRoonData
#' @export
exampleDataPath <- function(polarity = "positive")
{
    assertPolarity(polarity)
    system.file(file.path("extdata", if (polarity == "positive") "pos" else "neg"), package = "patRoonData")
}

#' @details \code{exampleAnalysisInfo} is a helper function that generate analysis information that can be directly used
#'   by \pkg{patRoon}.
#' @rdname patRoonData
#' @export
exampleAnalysisInfo <- function(polarity = "positive")
{
    assertPolarity(polarity)
    if (!requireNamespace("patRoon", quietly = TRUE))
        stop("Please make sure that patRoon is installed!", call. = FALSE)
    suffix <- if (polarity == "positive") "pos" else "neg"
    patRoon::generateAnalysisInfo(exampleDataPath(polarity),
                                  groups = c(rep(paste0("solvent-", suffix), 3),
                                             rep(paste0("standard-", suffix), 3)),
                                  blanks = paste0("solvent-", suffix))
}

#' Example suspect lists
#'
#' The \code{suspectsPos} and \code{suspectsNeg} datasets are example suspect lists for a set of environmental
#' contaminants (measured in positive and negative ionization, respectively). The datasets can be directly used with the
#' \code{\link[patRoon]{screenSuspects}} function.
#'
#' @format A \code{data.frame} with column \code{name}, \code{mz}, \code{rt} and \code{SMILES}, specifying the analyte
#'   name, \emph{m/z}, retention time (in seconds) and SMILES, respectively.
#' @name suspects
#' @author Dominique Narain-Ford, Samira Absalah, Rick Helmus and Vittorio Albergamo
#' @keywords datasets
NULL

#' @format 
#' @aliases suspectsPos
#' @rdname suspects
"suspectsPos"

#' @format 
#' @aliases suspectsNeg
#' @rdname suspects
"suspectsNeg"
