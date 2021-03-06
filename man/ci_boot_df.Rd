% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ci_boot_df.R
\name{ci_boot_df}
\alias{ci_boot_df}
\title{Calculate mean with confidence intervals from boostrapped samples.}
\usage{
ci_boot_df(.data, .summary_var, ..., ci = 0.95, groups_col = FALSE, B = 1000)
}
\arguments{
\item{.data}{A data frame}

\item{.summary_var}{Variable that is being summarized}

\item{...}{Grouping variable(s)}

\item{ci}{Confidence interval. Defaults to 0.95}

\item{groups_col}{List grouping variable under column named 'group'. Defaults
to FALSE.}

\item{B}{Number of bootstrap resamples. Defaults to 1000.}
}
\value{
A data frame with variables \verb{mean_\{\{.summary_var\}\}}, \code{ci_low}, \code{ci_high}, \code{sd}, \code{n}.
If the data frame is grouped, grouping variable will also be listed.
}
\description{
Calculate mean with confidence intervals from boostrapped samples.
}
\examples{
ci_boot_df(mtcars, mpg, cyl, gear)
}
\seealso{
\code{\link[Hmisc:smean.sd]{Hmisc::smean.cl.boot()}} which this function utilizes
}
