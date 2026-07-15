#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(pwd)/common.sh"

# List Users
$(pwd)/list_headscale_users.sh

# Get User
read -p "Enter the ID for the User to generate a PreAuth Key for: " user_id
if [[ ${user_id} == "" ]]; then
    fail_with_error "User ID must not be blank"
fi

# Get PreAuth Key for a User
podman exec -it \
    "${name_server}" \
    headscale preauthkeys create --user "${user_id}"
