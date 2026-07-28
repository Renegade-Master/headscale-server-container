#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(dirname $0)/common.sh"

# Send command to Headscale
podman exec -it \
    "${headscale_name}" \
    headscale ${@}
