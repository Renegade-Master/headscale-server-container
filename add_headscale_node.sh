#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(dirname $0)/common.sh"

# Get the Username
read -p "Enter the Username for the User to be added to a Node: " user_name
if [[ ${user_name} == "" ]]; then
    fail_with_error "Username must not be blank"
fi

# Get the Auth ID
read -p "Enter the Auth ID for the Node: " auth_id
if [[ ${auth_id} == "" ]]; then
    fail_with_error "Auth ID must not be blank"
fi

# Add a Node to a User
podman exec -it \
    "${headscale_name}" \
    headscale auth register \
        --auth-id "${auth_id}" \
        --user "${user_name}"
