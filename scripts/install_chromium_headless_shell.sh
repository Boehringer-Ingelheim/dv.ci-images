#!/bin/bash
set -e

# Chromium 134 breaks chromote (see https://stackoverflow.com/a/79489622)
# We install the headless version and mark it as non-upgradable for good measure
apt-get update -y
apt-get install -y software-properties-common
add-apt-repository -y ppa:xtradeb/apps
apt-get install -y chromium-headless-shell
apt-mark hold chromium-headless-shell
