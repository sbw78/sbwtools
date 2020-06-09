# sbwtools

<!-- badges: start --> <!-- badges: end -->

**sbwtools** is a package containing my most frequently used custom functions.

## Installation

You can install the released version of sbwtools from github with:

``` r 
devtools::install_github("sbw78/sbwtools")
```

## Functions 

`ci_df`: Build a dataframe with the mean and confidence intervals
of a continuous variable, with optional grouping.

`ci_boot_df`: Same as `ci_df`, but with bootstrapped sampling

`custom_kable`: Customized `knitr::kable` output.

`forma_pval`: Format p-values (i.e. "< .001" for values less than .001).

`hh`: Get first 5 rows and first 5 columns of a data frame or matrix

`ht`: Get the first 10 rows and last 10 rows of a data frame or matrix.

`install_load_packages`: This function will check for each package in the
user-defined and install them if they are missing, and then load them. It also
takes a list of github packages and their repos.

`last`: Get the last element of a vector or list

`make_forest_plot`: Build a forest plot.

`regex_build`: Combine a character vector into a single regex list.

`se`: Calculate standard error.
