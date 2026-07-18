#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(dirname $0)/common.sh"

# List Users
${work_dir}/list_headscale_api_keys.sh

# Get API Key
podman exec -it \
    "${headscale_name}" \
    headscale apikeys create
