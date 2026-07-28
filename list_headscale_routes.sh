#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(dirname $0)/common.sh"

# List all Routes
podman exec -it \
    "${headscale_name}" \
    headscale nodes list-routes
