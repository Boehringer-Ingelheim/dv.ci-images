#!/bin/bash
set -e

# List of system dependencies
pkgs_to_install="\
lbzip2 \
rsync \
qpdf \
"
apt-get update -y
apt-get install -q -y ${pkgs_to_install}

# Clean up
apt-get autoremove -y
apt-get autoclean -y
rm -rf /var/lib/apt/lists/*

# Install lychee URL checker
curl -sL "https://github.com/lycheeverse/lychee/releases/download/v0.14.3/lychee-v0.14.3-x86_64-unknown-linux-gnu.tar.gz" | tar -xvzf - &&
install -t "$HOME/.local/bin" -D lychee && 
rm lychee