#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(pwd)/common.sh"

# List all Users
podman exec -it \
    "${name_server}" \
    headscale nodes list
