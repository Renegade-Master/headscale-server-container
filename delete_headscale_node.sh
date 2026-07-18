#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(pwd)/common.sh"

# List Nodes
${work_dir}/list_headscale_nodes.sh

# Get Node Identifier
read -p "Enter the ID for the Node to be deleted: " node_id
if [[ ${node_id} == "" ]]; then
    fail_with_error "Node ID must not be blank"
fi

# Delete a Node
podman exec -it \
    "${headscale_name}" \
    headscale node delete \
        --identifier "${node_id}"
