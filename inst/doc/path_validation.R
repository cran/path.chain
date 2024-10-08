## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----options.backup-----------------------------------------------------------
old.options <- options()

## ----setup--------------------------------------------------------------------
library(path.chain)
library(logger)

log_level(ERROR)
log_appender(appender_console)
on_path_not_exists(~ log_error("Path {.x} not exists"))

level2.b <- path_link("fileA.RData")
level2.a <- path_link("fileB.fst")
level1   <- path_link("data", list(level2.a = level2.a , level2.b = level2.b))
root     <- path_link("files", list(level1))
root$data$level2.a

on_path_not_exists(NULL)

root$data$level2.a


## ----validate.path------------------------------------------------------------
is_path_valid <- function(x) if (!grepl("\\.fst", x)) print("Invalid file")
on_validate_path(is_path_valid)

root$data$level2.a
root$data$level2.b

## ----clean--------------------------------------------------------------------
options(old.options)

