#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(dirname $0)/common.sh"

# List Routes
${work_dir}/list_headscale_routes.sh

read -p "Enter the ID for the Route or Exit Node to be added: " route_id
if [[ ${route_id} == "" ]]; then
    route_id=""
fi

# Add a Route or Exit Node
podman exec -it \
    "${headscale_name}" \
    headscale routes enable \
        --route "${route_id}"
