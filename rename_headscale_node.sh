#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(dirname $0)/common.sh"

# List Nodes
${work_dir}/list_headscale_nodes.sh

# Get Node Identifier
read -p "Enter the ID for the Node to be renamed: " node_id
if [[ ${node_id} == "" ]]; then
    fail_with_error "Node ID must not be blank"
fi

# Get new Node Name
read -p "Enter the new name for the Node: " new_name
if [[ ${new_name} == "" ]]; then
    fail_with_error "Name must not be blank"
fi

# Rename a Node
podman exec -it \
    "${headscale_name}" \
    headscale nodes rename \
        --identifier "${node_id}" \
        --new-name "${new_name}"
