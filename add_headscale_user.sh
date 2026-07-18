#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(dirname $0)/common.sh"

# Get User Information
read -p "Enter the name for the new User [default: user]: " user_name
if [[ ${user_name} == "" ]]; then
    user_name="user"
fi

read -p "Enter the display name for the new User [default: ${user_name}]: " user_display_name
if [[ ${user_display_name} == "" ]]; then
    user_display_name="${user_name}"
fi

read -p "Enter the associated email for the new User [default: ]: " user_email
if [[ ${user_email} == "" ]]; then
    user_email=""
fi

# Add a User
podman exec -it \
    "${headscale_name}" \
    headscale users create \
        --display-name "${user_display_name}" \
        --email "${user_email}" \
        "${user_name}"
