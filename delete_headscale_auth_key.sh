#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(dirname $0)/common.sh"

# List PreAuth Keys
${work_dir}/list_headscale_auth_keys.sh

# Get PreAuth Key Identifier
read -p "Enter the ID for the PreAuth Key to be deleted: " preauth_key_id
if [[ ${preauth_key_id} == "" ]]; then
    fail_with_error "PreAuth Key ID must not be blank"
fi

# Delete a PreAuth Key
podman exec -it \
    "${headscale_name}" \
    headscale preauthkeys delete \
        --id "${preauth_key_id}"
