#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(dirname $0)/common.sh"

# Exit any existing Headscale Containers
podman stop "${headscale_name}" && podman rm "${headscale_name}" || true

if [[ -z $1 ]]; then
    # Enter a Port to expose
    read -p "Enter the Port that the Server should listen on for new connections [default: 8080]: " server_port
    if [[ ${server_port} == "" ]]; then
        server_port="8080"
    fi
else
    server_port="$1"
fi

# Start Headscale server process
podman run \
  --name "${headscale_name}" \
  --detach \
  --network "headscale" \
  --label "me.tale.headplane.target=headscale" \
  --volume "${headscale_data_dir}/config":"/etc/headscale:Z" \
  --volume "${headscale_data_dir}/lib":"/var/lib/headscale:Z" \
  --publish "${server_port}:8080/tcp" \
  --publish "9090:9090/tcp" \
  --health-cmd "CMD headscale health" \
  --restart "unless-stopped" \
  "${headscale_image}" \
  serve
