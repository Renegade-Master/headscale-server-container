#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(dirname $0)/common.sh"

# List API Keys
print_msg "Listing API Keys"
${work_dir}/list_headscale_api_keys.sh

# List PreAuth Keys
print_msg "Listing PreAuth Keys"
${work_dir}/list_headscale_auth_keys.sh

# List Nodes
print_msg "Listing Nodes"
${work_dir}/list_headscale_nodes.sh

# List Routes
print_msg "Listing Node Routes"
${work_dir}/list_headscale_routes.sh

# List Users
print_msg "Listing Users"
${work_dir}/list_headscale_users.sh
