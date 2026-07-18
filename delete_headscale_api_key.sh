#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(dirname $0)/common.sh"

# List API Keys
${work_dir}/list_headscale_auth_keys.sh

# Get API Key Identifier
read -p "Enter the ID for the API Key to be deleted: " api_key_id
if [[ ${api_key_id} == "" ]]; then
    fail_with_error "API Key ID must not be blank"
fi

# Delete a API Key
podman exec -it \
    "${headscale_name}" \
    headscale apikeys delete \
        --id "${api_key_id}"
