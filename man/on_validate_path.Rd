% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check.R
\name{on_validate_path}
\alias{on_validate_path}
\title{Function called to validate path correctness}
\usage{
on_validate_path(fun)
}
\arguments{
\item{fun}{a function; if missing, returns value of the path.chain.on.path.not.exists option}
}
\description{
Function called to validate path correctness
}
\examples{
# We'll create an options backup for this example
old.options <- options()
is_path_valid <- function(x) grepl("\\\\.fst", x)
on_validate_path(is_path_valid)
on_validate_path()
options(old.options)
}
