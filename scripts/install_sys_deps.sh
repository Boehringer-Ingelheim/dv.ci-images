#!/bin/bash
set -e

# List of system dependencies
pkgs_to_install="\
curl \
lbzip2 \
rsync \
qpdf \
wget \
"
apt-get update -y
# shellcheck disable=SC2086
apt-get install -q -y ${pkgs_to_install}

# Clean up
apt-get autoremove -y
apt-get autoclean -y
rm -rf /var/lib/apt/lists/*
