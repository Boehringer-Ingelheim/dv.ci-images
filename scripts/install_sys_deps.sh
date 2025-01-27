#!/bin/bash
set -e

# List of system dependencies
pkgs_to_install="\
curl \
lbzip2 \
rsync \
qpdf \
wget \
texlive-latex-base\
"
# texlive-latex-base because it contains `pdflatex`
apt-get update -y
# shellcheck disable=SC2086
apt-get install -q -y ${pkgs_to_install}

# Clean up
apt-get autoremove -y
apt-get autoclean -y
rm -rf /var/lib/apt/lists/*

# Install lychee URL checker
curl -Ls https://github.com/lycheeverse/lychee/releases/download/v"${LYCHEE_VERSION}"/lychee-v"${LYCHEE_VERSION}"-"$(arch)"-unknown-linux-gnu.tar.gz | tar xz -C /usr/local/bin