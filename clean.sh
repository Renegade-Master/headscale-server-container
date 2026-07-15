#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(pwd)/common.sh"

# Exit any existing Headscale Containers
podman stop "${name_server}" && podman rm "${name_server}" || true

print_msg "Moving [data] folder..."
mkdir -p "$(pwd)/.bak"
mv "$(pwd)/data" "$(pwd)/.bak/data-$(date +%Y%m%dT%H%M%SZ)" || true
print_msg "[data] folder moved."

print_msg "Creating [data,lib] folder..."
mkdir -p "$(pwd)/data/config" "$(pwd)/data/lib"
print_msg "[data,lib] folder created."

print_msg "Downloading Configuration File for [${image_version}]..."
wget --output-document "${data_dir}/config.yaml" "${config_url}"
