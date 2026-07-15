#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(dirname $0)/common.sh"

# Exit any existing Headscale Containers
podman stop "${name_server}" && podman rm "${name_server}" || true

# Start Headscale server process
podman run \
  --name="${name_server}" \
  --detach \
  --volume "${data_dir}":"/etc/headscale:Z" \
  --volume "${work_dir}/lib":"/var/lib/headscale:Z" \
  --publish "8080:8080/tcp" \
  --publish "9090:9090/tcp" \
  --publish "51820:51820/tcp" \
  --health-cmd "CMD headscale health" \
  --restart "unless-stopped" \
  "${image}" \
  serve
