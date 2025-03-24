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

# Install lychee URL checker

curl -Ls https://github.com/lycheeverse/lychee/releases/download/v"${LYCHEE_VERSION}"/lychee-v"${LYCHEE_VERSION}"-"$(arch)"-unknown-linux-gnu.tar.gz --output-dir /tmp/ -o lychee.tar.gz
lychee_md5sum=$(md5sum /tmp/lychee.tar.gz | cut -d ' ' -f 1)
if [ "$lychee_md5sum" != "$EXPECTED_LYCHEE_MD5SUM" ]; then
    exit 1
fi
tar xz -f /tmp/lychee.tar.gz -C /usr/local/bin
