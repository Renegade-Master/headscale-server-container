#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(dirname $0)/common.sh"

# Exit any existing Caddy containers
podman stop "${caddy_name}" && podman rm "${caddy_name}" || true

# Start Caddy reverse proxy with automatic TLS
podman run \
    --name "${caddy_name}" \
    --detach \
    --network "headscale" \
    --volume "${caddy_data_dir}/Caddyfile:/etc/caddy/Caddyfile:Z,ro" \
    --volume "${caddy_data_dir}/data":"/data:Z" \
    --volume "${caddy_data_dir}/config":"/config:Z" \
    --publish "80:80/tcp" \
    --publish "443:443/tcp" \
    --health-cmd "CMD caddy version" \
    --restart "unless-stopped" \
    "${caddy_image}"
