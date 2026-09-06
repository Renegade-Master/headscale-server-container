#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(dirname $0)/common.sh"

# Exit any existing Headscale Containers
podman stop "${headscale_name}" && podman rm "${headscale_name}" || true

# Start Headscale server process
podman run \
  --name "${headscale_name}" \
  --detach \
  --network "headscale" \
  --label "me.tale.headplane.target=headscale" \
  --volume "${headscale_data_dir}/config":"/etc/headscale:Z" \
  --volume "${headscale_data_dir}/lib":"/var/lib/headscale:Z" \
  --health-cmd "CMD headscale health" \
  --restart "unless-stopped" \
  "${headscale_image}" \
  serve
