#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(pwd)/common.sh"

# Get User Information
read -p "Enter the ID for the User to be deleted: " user_id
if [[ ${user_id} == "" ]]; then
    fail_with_error "User ID must not be blank"
fi

# Delete a User
podman exec -it \
    "${name_server}" \
    headscale users destroy \
        --identifier "${user_id}"
