#!/usr/bin/env bash
set +x -e -o pipefail

DEBUG=0

if [[ "$DEBUG" == "1" ]]; then
    set -x
fi

print_msg() {
    currdate="$(date +%Y-%m-%dT%H:%M:%SZ)"

    printf "${currdate} -- %s\n" "$1"
}

fail_with_error() {
    error="$1"

    printf "Error: [%s]\n" "$1"
    printf "Exiting...\n"
    exit 1
}

headscale_image_path="ghcr.io/juanfont/headscale"
headscale_image_version="v0.29.2"
headscale_image="${headscale_image_path}:${headscale_image_version}"

headplane_image_path="ghcr.io/tale/headplane"
headplane_image_version="0.7.0"
headplane_image="${headplane_image_path}:${headplane_image_version}"

work_dir="$(dirname $0)"
data_dir="${work_dir}/data"
headscale_data_dir="${data_dir}/headscale-config"
headplane_data_dir="${data_dir}/headplane-config"

headscale_config_url="https://raw.githubusercontent.com/juanfont/headscale/refs/tags/${headscale_image_version}/config-example.yaml"
headplane_config_url="https://raw.githubusercontent.com/tale/headplane/refs/tags/v${headplane_image_version}/config.example.yaml"

headscale_name="headscale"
headplane_name="headplane"
