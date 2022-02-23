#!/bin/bash

failed_roles=()

for roledir in roles/*/molecule; do
  role_path=$(dirname $roledir)
  role_name=$(basename $role_path)
  echo "::group::Ansible role $role_name"
  pushd ${role_path}
  molecule test --all || failed_roles+=($role_name)
  popd
  echo "::endgroup::"
done

if [[ ${#failed_roles[@]} -ne 0 ]]; then
  echo "${failed_roles[@]}"
  exit 1
fi
