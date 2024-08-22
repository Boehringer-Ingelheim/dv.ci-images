#!/usr/bin/env Rscript

# Get pak package via normal route
install.packages("pak")

# Packages to install
install_pkgs <- c(
  "tinytex",
  "rcmdcheck",
  "roxygen2",
  "lintr",
  "pkgdown",
  "rmarkdown",
  "devtools",
  "pharmaverseadam",
  "shinytest2",
  "golem",
  "shinymeta",
  "shinyjs",
  "AzureAuth",
  "pharmaverseadam",
  "DT",
  "openxlsx",
  "shinyFeedback"
)

# Install packages
pak::pak(
  pkg = install_pkgs,
  dependencies = TRUE,
  ask = FALSE,
  upgrade = FALSE
)

# Install tinytex
tinytex::install_tinytex()

# Remove DaVinci packages from image
grep("^dv.", rownames(installed.packages()), value = TRUE) |> sapply(remove.packages)
