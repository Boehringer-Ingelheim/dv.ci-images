#!/usr/bin/env Rscript

# Get pak package via normal route
install.packages("pak")

# Packages to install
install_pkgs <- c(
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

# Remove DaVinci packages from image
grep("^dv.", rownames(installed.packages()), value = TRUE) |> sapply(remove.packages)


# Install teal packages
teal_pkgs <- c(
  "teal.data",
  "teal.modules.clinical",
  "teal.modules.general",
  "teal.slice",
  "teal.transform"
  )

pak::pak(
  pkg = teal_pkgs,
  dependencies = TRUE,
  ask = FALSE,
  upgrade = FALSE
)
