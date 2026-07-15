#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(pwd)/common.sh"

# List Users
$(pwd)/list_headscale_nodes.sh

# Get User Information
read -p "Enter the ID for the Node to be deleted: " node_id
if [[ ${node_id} == "" ]]; then
    fail_with_error "Node ID must not be blank"
fi

# Delete a User
podman exec -it \
    "${name_server}" \
    headscale node destroy \
        --identifier "${node_id}"
