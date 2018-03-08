#' Test data for the patRoon package
#'
#' A small set of LC-HRMS data to test and demonstrate the functionality of
#' patRoon.
#'
#' This package contains data files from (a) a standard mixture containing
#' various polar contaminants and (b) a blank solvent. Both were analysed in
#' triplicate, using an Shimadzu Nexera UHPLC coupled to an high resolution
#' quadrupole time of flight instrument (Bruker maXis 4G Q-TOF) using positive
#' electrospray ionization.
#'
#' To reduce file sizes, the data has been filtered to only contain the first
#' ten minutes of the chromatographic run with \emph{m/z} 75-300. This filtering
#' step was performed with the \command{msconvert} command of
#' \href{http://proteowizard.sourceforge.net/index.shtml}{ProteoWizard}. The
#' complete data processing script can be found in data-raw/process.R
#'
#' @name patRoonData
NULL

#' @details \code{exampleDataPath} is a helper function that returns the file
#'   path of the example data.
#'
#' @rdname patRoonData
#' @export
exampleDataPath <- function() system.file("extdata", package = "patRoonData")


#' Example target analyte list
#'
#' The \code{targets} dataset contains information for 23 target analytes and
#' can directly be used with the \code{\link[patRoon]{screenTargets}} function.
#'
#' @format A \code{data.frame} with column \code{name}, \code{mz} and \code{rt},
#'   specifying the analyte name, \emph{m/z} and retention time (in seconds),
#'   respectively.
"targets"
