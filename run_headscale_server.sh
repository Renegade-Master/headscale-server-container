#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(dirname $0)/common.sh"

# Exit any existing Headscale Containers
podman stop "${name_server}" && podman rm "${name_server}" || true

# Enter a Port to expose
read -p "Enter the Port that the Server should listen on for new connections [default: 8080]: " server_port
if [[ ${server_port} == "" ]]; then
    server_port="8080"
fi

# Start Headscale server process
podman run \
  --name="${name_server}" \
  --detach \
  --volume "${data_dir}":"/etc/headscale:Z" \
  --volume "${work_dir}/lib":"/var/lib/headscale:Z" \
  --publish "${server_port}:8080/tcp" \
  --publish "9090:9090/tcp" \
  --health-cmd "CMD headscale health" \
  --restart "unless-stopped" \
  "${image}" \
  serve
