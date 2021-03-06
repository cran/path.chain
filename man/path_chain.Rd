% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/path-chain.R
\name{path_chain}
\alias{path_chain}
\title{Get directory structure and create path_chain object}
\usage{
path_chain(path, naming = basename)
}
\arguments{
\item{path}{root of the directory structure}

\item{naming}{function, which defines naming convention}
}
\value{
path_chain object
}
\description{
Returns `path_chain` object, which reflects
structure of the folder passed with `path` param
}
\examples{
tmp <- create_temp_dir("files")
create_sample_dir(tmp, override = TRUE)
fs::dir_tree(tmp)
chainable.path <- path_chain(tmp)
chainable.path$data$persons.csv
# With customized naming convention
chainable.path <- path_chain(tmp, naming = naming_k)
chainable.path$kData$kPersons
}
