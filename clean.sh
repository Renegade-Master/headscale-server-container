#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(dirname $0)/common.sh"

# Exit any existing Containers
print_msg "Stopping and Removing Headscale and Headplane Containers..."
podman stop "${headscale_name}" && podman rm "${headscale_name}" || true
podman stop "${headplane_name}" && podman rm "${headplane_name}" || true
print_msg "Containers removed."


print_msg "Recreating the Headscale Network..."
podman network rm headscale || true
podman network create headscale
print_msg "Network created."

print_msg "Moving [data] folder..."
mkdir -p "${work_dir}/.bak"
mv "${work_dir}/data" "${work_dir}/.bak/data-$(date +%Y%m%dT%H%M%SZ)" || true
print_msg "[data] folder moved."

print_msg "Creating Headscale [config,lib] folder..."
mkdir -p "${headscale_data_dir}/config" "${headscale_data_dir}/lib"
print_msg "[config,lib] folder created."

print_msg "Creating Headplane [config,lib] folder..."
mkdir -p "${headplane_data_dir}/config" "${headplane_data_dir}/lib"
print_msg "[config,lib] folder created."

print_msg "Downloading Headscale Configuration File for [${headscale_image_version}]..."
wget --output-document "${headscale_data_dir}/config/config.yaml" "${headscale_config_url}"

print_msg "Downloading Headplane Configuration File for [${headplane_image_version}]..."
wget --output-document "${headplane_data_dir}/config/config.yaml" "${headplane_config_url}"

print_msg "Creating Headscale Policy File..."
printf "{}\n" > "${headscale_data_dir}/config/policy.json"
