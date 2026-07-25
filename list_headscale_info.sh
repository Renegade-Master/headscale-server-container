#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(dirname $0)/common.sh"

# List API Keys
${work_dir}/list_headscale_api_keys.sh

# List PreAuth Keys
${work_dir}/list_headscale_auth_keys.sh

# List Nodes
${work_dir}/list_headscale_nodes.sh

# List Users
${work_dir}/list_headscale_users.sh
