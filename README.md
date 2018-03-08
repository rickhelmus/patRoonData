# patRoonData

This R package contains example to test and demonstrate the [patRoon R package][patRoon].
The data is used in the [package vignette][patRoon-tutorial] to demonstrate the various functionalities of patRoon regarding mass spectrometry based non-target analysis.

This data package contains
* a triplicate analysis of a blank solvent (useful for blank subtraction)
* a triplicate analysis of a standard mixture containing a wide range of polar contaminants.

To reduce file sizes, the data has been filtered to only contain the first ten minutes of the chromatographic run with _m/z_ 75-250. This filtering step was performed with the `FileFilter` command of [OpenMS]. The complete data processing script can be found in data-raw/process.R

## Installation

You can install patRoonData from github with:

``` r
install.packages("devtools")
devtools::install_github("rickhelmus/patRoonData")
```

## More information

Please see the [patRoon web page][patRoon-web].


[patRoon]: https://github.com/rickhelmus/patRoon
[patRoon-web]: https://rickhelmus.github.io/patRoon/
[patRoon-tutorial]: https://github.com/rickhelmus/patRoon/blob/master/docs/articles/tutorial.html
[OpenMS]: http://openms.de/
