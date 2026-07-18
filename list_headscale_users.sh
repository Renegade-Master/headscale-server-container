#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(pwd)/common.sh"

# List all Users
podman exec -it \
    "${headscale_name}" \
    headscale users list
