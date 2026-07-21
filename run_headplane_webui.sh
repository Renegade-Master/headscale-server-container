#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(dirname $0)/common.sh"

# Exit any existing Headscale Containers
podman stop "${headplane_name}" && podman rm "${headplane_name}" || true

server_port="${1:-3000}"

if [[ "$#" -lt 1 ]]; then
    # Enter a Port to expose
    read -p "Enter the Port that the Server should listen on for new connections [default: 3000]: " server_port
    if [[ ${server_port} == "" ]]; then
        server_port="3000"
    fi
else
    server_port="$1"
fi

# Start Headscale server process
podman run \
  --name "${headplane_name}" \
  --detach \
  --network "headscale" \
  --volume "${headplane_data_dir}/config/config.yaml":"/etc/headplane/config.yaml:Z" \
  --volume "${headplane_data_dir}/lib/":"/var/lib/headplane:Z" \
  --volume "${headscale_data_dir}/config/config.yaml:/etc/headscale/config.yaml:Z" \
  --volume "/var/run/user/1000/podman/podman.sock:/var/run/docker.sock:ro" \
  --publish "${server_port}:3000/tcp" \
  --health-cmd "CMD /bin/hp_healthcheck" \
  --restart "unless-stopped" \
  "${headplane_image}"
