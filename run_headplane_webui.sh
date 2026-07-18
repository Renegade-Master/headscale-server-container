#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(dirname $0)/common.sh"

# Exit any existing Headscale Containers
podman stop "${headplane_name}" && podman rm "${headplane_name}" || true

# Enter a Port to expose
read -p "Enter the Port that the Server should listen on for new connections [default: 3000]: " server_port
if [[ ${server_port} == "" ]]; then
    server_port="3000"
fi

# Start Headscale server process
podman run \
  --name="${headplane_name}" \
  --volume "${headplane_data_dir}/config/config.yaml":"/etc/headplane/config.yaml:Z" \
  --volume "${headplane_data_dir}/lib/":"/var/lib/headplane:Z" \
  --publish "${server_port}:3000/tcp" \
  --health-cmd "CMD /bin/hp_healthcheck" \
  --restart "unless-stopped" \
  "${headplane_image}"
