#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(dirname $0)/common.sh"

# List Users
${work_dir}/list_headscale_users.sh

# Get User Identifier
read -p "Enter the ID for the User to be deleted: " user_id
if [[ ${user_id} == "" ]]; then
    fail_with_error "User ID must not be blank"
fi

# Delete a User
podman exec -it \
    "${headscale_name}" \
    headscale users destroy \
        --identifier "${user_id}"
