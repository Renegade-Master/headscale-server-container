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

image_path="ghcr.io/juanfont/headscale"
image_version="v0.29.2"
image="${image_path}:${image_version}"

work_dir="$(dirname $0)/data"
data_dir="${work_dir}/config"

config_url="https://raw.githubusercontent.com/juanfont/headscale/refs/tags/${image_version}/config-example.yaml"

name_server="headscale-server"
