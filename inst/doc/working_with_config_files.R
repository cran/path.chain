## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(path.chain)
library(magrittr)

# Create an example file stucture
tmp <- create_temp_dir("files")
create_sample_dir(tmp, override = TRUE)

# Sample structure we've already created looks as follows
fs::dir_tree(tmp)

## ----possible.structures------------------------------------------------------
tmp <- create_temp_dir("files")
full.path.chain <- full_path_chain(tmp)

print(full.path.chain)

full.path.chain %>% 
  yaml::write_yaml(temp_path("config.yaml"))

## ----custom.naming.function---------------------------------------------------

naming_fun <- function(x){
  paste0("k", tools::file_path_sans_ext(stringi::stri_trans_totitle(basename(x))))
}

full.path.chain.2 <- full_path_chain(temp_path("files"), "kRoot", naming_fun)

full.path.chain.2 %>% 
  yaml::write_yaml(temp_path("config.yaml"))

## ----wrapped------------------------------------------------------------------
list(kDirs = full.path.chain.2) %>% 
  list(default = .) %>% 
  yaml::write_yaml(temp_path("config.yaml"))

## ----loading.full.path.config-------------------------------------------------
k.dirs <- config::get("kDirs", config = "default", file = temp_path("config.yaml"))
k.dirs$kDocs$kRoot
k.dirs$kData$kExample1

## ----absolute.full.path-------------------------------------------------------
full_path_chain(normalizePath(temp_path("files")), "kRoot", naming_fun) %>% 
  as_config("default", "kDirs") %>% 
  yaml::write_yaml(temp_path("config.yaml"))

## ----path_chain---------------------------------------------------------------
path.chain <- path_chain(temp_path("files"), naming = naming_fun)

class(path.chain)

print(path.chain$kData$kExample1)

# Most verbose version
path.chain %>% 
  as.list(root.name = "kRoot") %>%
  as_config("default", "kDirs") %>% 
  yaml::write_yaml(temp_path("config.yaml"))

# Conciser
path.chain %>% 
  as_config("default", "kDirs", root.name = "kRoot") %>% 
  yaml::write_yaml(temp_path("config.yaml"))


## ----as_path_chain------------------------------------------------------------
k.dirs <- config::get("kDirs", "default", temp_path("config.yaml")) %>% 
  as_path_chain()

class(k.dirs)

k.dirs$kData$.
k.dirs$kData$kExample1


