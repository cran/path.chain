% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/conversion.R
\name{as_config}
\alias{as_config}
\alias{as_config.path_chain}
\alias{as_config.list}
\title{Prepare list to be saved as config .yaml file}
\usage{
as_config(x, config = "default", wrap = "dirs", ...)

\method{as_config}{path_chain}(x, config = "default", wrap = "dirs",
  ..., root.name = "root.dir")

\method{as_config}{list}(x, config = "default", wrap = "dirs", ...)
}
\arguments{
\item{x}{list with directory structure}

\item{config}{configuration name}

\item{wrap}{key name to wrap directory structure}

\item{...}{additional arguments (not used at the moment)}

\item{root.name}{key for root directory (for path_chain only)}
}
\value{
list compatible with `{config}` package
}
\description{
This function is provided to keep compatibility
with `{config}` package, which requires existence of default key.
Additionally, we can at once wrap our structure with some other keys,
in order to not to mix directory structur with different keys.
}
\examples{
library(magrittr)
# Initalizaing sample directory
tmp <- create_temp_dir("files")
create_sample_dir(tmp, override = TRUE)
full_path_chain(tmp, "kRoot", naming_k) \%>\%
   list(kDirs = .) \%>\%
   list(default = .) \%>\%
   yaml::write_yaml(temp_path("config.yaml"))
# We can simply use such function
full_path_chain(tmp, "kRoot", naming_k) \%>\%
   as_config("default", "kDirs") \%>\%
   yaml::write_yaml(temp_path("config.yaml"))
}
