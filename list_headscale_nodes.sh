#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(dirname $0)/common.sh"

user_id="${1:-"NOT_SET"}"

if [[ $user_id == "NOT_SET" ]]; then
    # List all Nodes
    podman exec -it \
        "${headscale_name}" \
        headscale nodes list
else
    # List all Nodes for a User
    podman exec -it \
        "${headscale_name}" \
        headscale nodes list \
          --user "${user_id}"
fi
