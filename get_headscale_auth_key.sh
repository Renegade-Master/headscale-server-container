#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(pwd)/common.sh"

# List Users
${work_dir}/list_headscale_users.sh

# Get User Identifier
read -p "Enter the ID for the User to generate a PreAuth Key for: " user_id
if [[ ${user_id} == "" ]]; then
    fail_with_error "User ID must not be blank"
fi

# Get PreAuth Key for a User
podman exec -it \
    "${headscale_name}" \
    headscale preauthkeys create --user "${user_id}"
