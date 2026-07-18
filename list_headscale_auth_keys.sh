#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(dirname $0)/common.sh"

# List all API Keys
podman exec -it \
    "${headscale_name}" \
    headscale preauthkeys list
