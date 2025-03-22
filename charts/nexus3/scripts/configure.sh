#!/usr/bin/env bash
set -euo pipefail

NEXUS_HOST="${NEXUS_HOST:-http://localhost:8081}"
NEXUS_USER="${NEXUS_USER:-admin}"
NEXUS_PASSWORD="${NEXUS_PASSWORD:-}"
CONFIG_DIR="${CONFIG_DIR:-/opt/sonatype/nexus/config}"

function error() {
  echo >&2 "ERROR: $*"
  exit 1
}

echo "Configuring Nexus3..."
sleep 5

tmp_dir="$(mktemp -d)"
trap 'rm -rf -- "${tmp_dir}"' EXIT

out_file="${tmp_dir}/out.json"
tmp_file="${tmp_dir}/tmp.json"

if [[ -z "${NEXUS_PASSWORD}" ]]; then
  error "No password was provided."
fi

while [[ "$(curl -s -o /dev/null -w "%{http_code}" "${NEXUS_HOST}/service/rest/v1/status" || true)" -ne "200" ]]; do
  echo "Waiting for Nexus..."
  sleep 15
done


json_file="${CONFIG_DIR}/conf/anonymous.json"
if [[ -f "${json_file}" ]]; then
  echo "Configuring anonymous access..."

  status_code="$(curl -sS -o /dev/null -w "%{http_code}" -X PUT -H 'Content-Type: application/json' \
    -u "${NEXUS_USER}:${NEXUS_PASSWORD}" -d "@${json_file}" "${NEXUS_HOST}/service/rest/v1/security/anonymous")"
  if [[ "${status_code}" -ne 200 ]]; then
    error "Could not configure anonymous access. Http response code '${status_code}'."
  fi

  echo "Anonymous access configured. Http response code '${status_code}'."
fi


json_file="${CONFIG_DIR}/conf/realms.json"
if [[ -f "${json_file}" ]]; then
  echo "Configuring realms..."

  status_code="$(curl -sS -o /dev/null -w "%{http_code}" -X PUT -H 'Content-Type: application/json' \
    -u "${NEXUS_USER}:${NEXUS_PASSWORD}" -d "@${json_file}" "${NEXUS_HOST}/service/rest/v1/security/realms/active")"
  if [[ "${status_code}" -ne 204 ]]; then
    error "Could not configure realms. Http response code '${status_code}'."
  fi

  echo "Realms configured. Http response code '${status_code}'."
fi


echo "Configuring blob stores..."
blobstores=$(mktemp)
status_code=$(curl -sS -o "${blobstores}" -w "%{http_code}" -X GET -H 'Content-Type: application/json' \
  -u "${NEXUS_USER}:${NEXUS_PASSWORD}" "${NEXUS_HOST}/service/rest/v1/blobstores")
if [[ "${status_code}" -eq 200 ]]; then
  if [[ "$(jq -r '.blobStores' "${CONFIG_DIR}"/conf/prunes.json)" = true ]]; then
    echo "Starting deleting blobstores."
    jq -c '.[]' ${blobstores} | while read i; do
      name="$(echo ${i} | jq -r '.name')"
      status_code=$(curl -sS -o /dev/null -w "%{http_code}" -X DELETE -H 'Content-Type: application/json' \
        -u "${NEXUS_USER}:${NEXUS_PASSWORD}" "${NEXUS_HOST}/service/rest/v1/blobstores/${name}")
      if [[ "${status_code}" -eq 204 ]]; then
        echo "Blobstores deleted '${name}'. Http response code '${status_code}'."
      else
        error "Problems with deleting a blobstore '${name}'. Http response code '${status_code}'."
      fi
    done
  else
    echo "The blobstores pruning feature is disabled."
  fi
else
  error "Problems with getting blobstores. Http response code '${status_code}'."
fi

for json_file in "${CONFIG_DIR}"/conf/*-blobstore.json; do
  if [[ -f "${json_file}" ]]; then
    type="$(jq -r '.type' "${json_file}")"
    name="$(jq -r '.name' "${json_file}")"

    status_code=$(curl -sS -o /dev/null -w "%{http_code}" -X GET -H 'Content-Type: application/json' \
      -u "${NEXUS_USER}:${NEXUS_PASSWORD}" "${NEXUS_HOST}/service/rest/v1/blobstores/${type}/${name}")
    if [[ "${status_code}" -eq 200 ]]; then
      status_code="$(curl -sS -o /dev/null -w "%{http_code}" -X PUT -H 'Content-Type: application/json' \
        -u "${NEXUS_USER}:${NEXUS_PASSWORD}" -d "@${json_file}" "${NEXUS_HOST}/service/rest/v1/blobstores/${type}/${name}")"
      if [[ "${status_code}" -ne 204 ]]; then
        error "Could not update blob store '${name}'. Http response code '${status_code}'."
      fi
    else
      status_code="$(curl -sS -o /dev/null -w "%{http_code}" -X POST -H 'Content-Type: application/json' \
        -u "${NEXUS_USER}:${NEXUS_PASSWORD}" -d "@${json_file}" "${NEXUS_HOST}/service/rest/v1/blobstores/${type}")"
      if [[ "${status_code}" -ne 204 ]] && [[ "${status_code}" -ne 201 ]]; then
        error "Could not create blob store '${name}'. Http response code '${status_code}'."
      fi
    fi

    echo "Blob store '${name}' configured. Http response code '${status_code}'."
  fi
done


echo "Configuring scripts..."
for script_file in /scripts/*.groovy; do
  if [[ -f "${script_file}" ]]; then
    name="$(basename "${script_file}" .groovy)"
    content="$(sed 's/\"/\\\"/g' "${script_file}" | sed ':a;N;$!ba;s/\n/\\n/g')"
    data="{ \"name\": \"${name}\", \"type\": \"groovy\", \"content\": \"${content}\" }"

    status_code=$(curl -sS -o /dev/null -w "%{http_code}" -X GET -u "${NEXUS_USER}:${NEXUS_PASSWORD}" "${NEXUS_HOST}/service/rest/v1/script/${name}")
    if [[ "${status_code}" -eq 200 ]]; then
      status_code=$(curl -sS -o /dev/null -w "%{http_code}" -X PUT -H 'Content-Type: application/json' \
        -u "${NEXUS_USER}:${NEXUS_PASSWORD}" -d "${data}" "${NEXUS_HOST}/service/rest/v1/script/${name}")

      if [[ "${status_code}" -ne 204 ]]; then
        error "Could not update script '${name}'. Http response code '${status_code}'."
      fi
    else
      status_code=$(curl -sS -o /dev/null -w "%{http_code}" -X POST -H 'Content-Type: application/json' \
        -u "${NEXUS_USER}:${NEXUS_PASSWORD}" -d "${data}" "${NEXUS_HOST}/service/rest/v1/script")

      if [[ "${status_code}" -ne 204 ]]; then
        error "Could not create script '${name}'. Http response code '${status_code}'."
      fi
    fi

    echo "Script '${name}' updated. Http response code '${status_code}'."
  fi
done


echo "Configuring cleanup policies..."
for json_file in "${CONFIG_DIR}"/conf/*-cleanup.json; do
  if [[ -f "${json_file}" ]]; then
    name="$(jq -r '.name' "${json_file}")"

    status_code=$(curl -sS -o /dev/null -w "%{http_code}" -X POST -H 'Content-Type: application/json' \
      -u "${NEXUS_USER}:${NEXUS_PASSWORD}" -d "@${json_file}" "${NEXUS_HOST}/service/rest/v1/script/cleanup/run")
    if [[ "${status_code}" -ne 200 ]]; then
      error "Could not configure cleanup policy '${name}'. Http response code '${status_code}'."
    fi

    echo "Cleanup policy '${name}' configured. Http response code '${status_code}'."
  fi
done


echo "Configuring repositories..."
repositories=$(mktemp)
status_code=$(curl -sS -o "${repositories}" -w "%{http_code}" -X GET -H 'Content-Type: application/json' \
  -u "${NEXUS_USER}:${NEXUS_PASSWORD}" "${NEXUS_HOST}/service/rest/v1/repositories")
if [[ "${status_code}" -eq 200 ]]; then
  if [[ "$(jq -r '.repositories' "${CONFIG_DIR}"/conf/prunes.json)" = true ]]; then
    echo "Starting deleting repositories."
    jq -c '.[]' ${repositories} | while read i; do
      name="$(echo ${i} | jq -r '.name')"
      status_code=$(curl -sS -o /dev/null -w "%{http_code}" -X DELETE -H 'Content-Type: application/json' \
        -u "${NEXUS_USER}:${NEXUS_PASSWORD}" "${NEXUS_HOST}/service/rest/v1/repositories/${name}")
      if [[ "${status_code}" -eq 204 ]]; then
        echo "Repository deleted '${name}'. Http response code '${status_code}'."
      else
        error "Problems with deleting a repository '${name}'. Http response code '${status_code}'."
      fi
    done
  else
    echo "The repository pruning feature is disabled."
  fi
else
  error "Problems with getting repositories. Http response code '${status_code}'."
fi

for json_file in "${CONFIG_DIR}"/conf/*-repo.json; do
  if [[ -f "${json_file}" ]]; then
    name="$(jq -r '.name' "${json_file}")"
    format="$(jq -r '.format' "${json_file}")"
    type="$(jq -r '.type' "${json_file}")"

    tmp_file="$(mktemp -p "${tmp_dir}")"
    jq -r 'del(.format,.type)' "${json_file}" >"${tmp_file}"
    json_file="${tmp_file}"

    if [[ "${type}" == "proxy" ]]; then
      password_file="${CONFIG_DIR}/secret/repo-${name}.password"
      if [[ ! -f "${password_file}" ]]; then
        password_file="${CONFIG_DIR}/secret/repo-credentials/${name}"
      fi
      if [[ -f "${password_file}" ]]; then
        tmp_file="$(mktemp -p "${tmp_dir}")"
        jq -r --arg password "$(cat "${password_file}")" '. * {httpClient: {authentication: {password: $password}}}' "${json_file}" > "${tmp_file}"
        json_file="${tmp_file}"
      fi
    fi

    status_code=$(curl -sS -o /dev/null -w "%{http_code}" -X GET -H 'Content-Type: application/json' \
      -u "${NEXUS_USER}:${NEXUS_PASSWORD}" "${NEXUS_HOST}/service/rest/v1/repositories/${format}/${type}/${name}")
    if [[ "${status_code}" -eq 200 ]]; then
      status_code="$(curl -sS -o /dev/null -w "%{http_code}" -X PUT -H 'Content-Type: application/json' \
        -u "${NEXUS_USER}:${NEXUS_PASSWORD}" -d "@${json_file}" "${NEXUS_HOST}/service/rest/v1/repositories/${format}/${type}/${name}")"
      if [[ "${status_code}" -ne 204 ]]; then
        error "Could not update repository '${name}'. Http response code '${status_code}'."
      fi
    else
      status_code="$(curl -sS -o /dev/null -w "%{http_code}" -X POST -H 'Content-Type: application/json' \
        -u "${NEXUS_USER}:${NEXUS_PASSWORD}" -d "@${json_file}" "${NEXUS_HOST}/service/rest/v1/repositories/${format}/${type}")"
      if [[ "${status_code}" -ne 201 ]]; then
        error "Could not create repository '${name}'. Http response code '${status_code}'."
      fi
    fi

    echo "Repository '${name}' configured. Http response code '${status_code}'."
  fi
done


echo "Configuring roles..."
for json_file in "${CONFIG_DIR}"/conf/*-role.json; do
  if [[ -f "${json_file}" ]]; then
    id="$(jq -r '.id' "${json_file}")"
    source="$(jq -r '.source // "default"' "${json_file}")"

    status_code=$(curl -sS -o /dev/null -w "%{http_code}" -X GET -H 'Content-Type: application/json' \
      -u "${NEXUS_USER}:${NEXUS_PASSWORD}" "${NEXUS_HOST}/service/rest/v1/security/roles/${id}?source=${source}")
    if [[ "${status_code}" -eq 200 ]]; then
      status_code="$(curl -sS -o /dev/null -w "%{http_code}" -X PUT -H 'Content-Type: application/json' \
        -u "${NEXUS_USER}:${NEXUS_PASSWORD}" -d "@${json_file}" "${NEXUS_HOST}/service/rest/v1/security/roles/${id}")"
      if [[ "${status_code}" -ne 204 ]]; then
        error "Could not update role '${id}'. Http response code '${status_code}'."
      fi
    else
      status_code="$(curl -sS -o /dev/null -w "%{http_code}" -X POST -H 'Content-Type: application/json' \
        -u "${NEXUS_USER}:${NEXUS_PASSWORD}" -d "@${json_file}" "${NEXUS_HOST}/service/rest/v1/security/roles")"
      if [[ "${status_code}" -ne 200 ]]; then
        error "Could not create role '${id}'. Http response code '${status_code}'."
      fi
    fi

    echo "Role '${id}' configured. Http response code '${status_code}'."
  fi
done


echo "Configuring users..."
users=$(mktemp)
status_code=$(curl -sS -o "${users}" -w "%{http_code}" -X GET -H 'Content-Type: application/json' \
  -u "${NEXUS_USER}:${NEXUS_PASSWORD}" "${NEXUS_HOST}/service/rest/v1/security/users")
if [[ "${status_code}" -eq 200 ]]; then
  if [[ "$(jq -r '.users' "${CONFIG_DIR}"/conf/prunes.json)" = true ]]; then
    echo "Starting deleting users."
    jq -c '.[]' ${users} | while read i; do
      user_id="$(echo ${i} | jq -r '.userId')"
      if [[ "${user_id}" != "admin" && "${user_id}" != "anonymous" ]]; then
        status_code=$(curl -sS -o /dev/null -w "%{http_code}" -X DELETE -H 'Content-Type: application/json' \
          -u "${NEXUS_USER}:${NEXUS_PASSWORD}" "${NEXUS_HOST}/service/rest/v1/security/users/${user_id}")
        if [[ "${status_code}" -eq 204 ]]; then
          echo "User deleted '${user_id}'. Http response code '${status_code}'."
        else
          error "Problems with deleting a user '${user_id}'. Http response code '${status_code}'."
        fi
      fi
    done
  else
    echo "The user pruning feature is disabled."
  fi
else
  error "Problems with getting users. Http response code '${status_code}'."
fi

for json_file in "${CONFIG_DIR}"/conf/*-user.json; do
  if [[ -f "${json_file}" ]]; then
    id="$(jq -r '.userId' "${json_file}")"
    source="$(jq -r '.source // "default"' "${json_file}")"

    out_file="$(mktemp -p "${tmp_dir}")"
    status_code=$(curl -sS -o "${out_file}" -w "%{http_code}" -X GET -H 'Content-Type: application/json' \
        -u "${NEXUS_USER}:${NEXUS_PASSWORD}" "${NEXUS_HOST}/service/rest/v1/security/users/?userId=${id}&source=${source}")
    if [[ "${status_code}" -eq 200 ]] && [[ -n "$(jq -r 'first(.[]).userId // empty' "${out_file}")" && "$(jq -r 'first(.[]).userId' "${out_file}")" == ${id} ]]; then
      status_code="$(curl -sS -o /dev/null -w "%{http_code}" -X PUT -H 'Content-Type: application/json' \
        -u "${NEXUS_USER}:${NEXUS_PASSWORD}" -d "@${json_file}" "${NEXUS_HOST}/service/rest/v1/security/users/${id}")"
      if [[ "${status_code}" -ne 204 ]]; then
        error "Could not update user '${id}'. Http response code '${status_code}'."
      fi
    else
      password_file="${CONFIG_DIR}/secret/user-${id}.password"
      if [[ ! -f "${password_file}" ]]; then
        echo "${RANDOM}" | md5sum | head -c 20 >"${password_file}"
      fi

      tmp_file="$(mktemp -p "${tmp_dir}")"
      jq -r --arg password "$(cat "${password_file}")" '. + {password: $password}' "${json_file}" > "${tmp_file}"
      json_file="${tmp_file}"

      status_code="$(curl -sS -o /dev/null -w "%{http_code}" -X POST -H 'Content-Type: application/json' \
        -u "${NEXUS_USER}:${NEXUS_PASSWORD}" -d "@${json_file}" "${NEXUS_HOST}/service/rest/v1/security/users")"
      if [[ "${status_code}" -ne 200 ]]; then
        error "Could not create user '${id}'. Http response code '${status_code}'."
      fi
    fi

    echo "User '${id}' configured. Http response code '${status_code}'."
  fi
done


json_file="${CONFIG_DIR}/conf/ldap.json"
if [[ -f "${json_file}" ]]; then
  echo "Configuring LDAP..."

  name="$(jq -r '.name' "${json_file}")"

  if [[ -f "${CONFIG_DIR}/secret/ldap.password" ]]; then
    tmp_file="$(mktemp -p "${tmp_dir}")"
    jq -r --arg password "$(sed 's|"|\\"|g;s|/|\\/|g' "${CONFIG_DIR}/secret/ldap.password")" '. + {authPassword: $password}' "${json_file}" >"${tmp_file}"
    json_file="${tmp_file}"
  fi

  out_file="$(mktemp -p "${tmp_dir}")"
  status_code=$(curl -sS -o "${out_file}" -w "%{http_code}" -X GET -H 'Content-Type: application/json' \
    -u "${NEXUS_USER}:${NEXUS_PASSWORD}" "${NEXUS_HOST}/service/rest/v1/security/ldap/${name// /%20}")
  if [[ "${status_code}" -eq 200 ]]; then
    tmp_file="$(mktemp -p "${tmp_dir}")"
    jq -r --arg id "$(jq -r '.id' "${out_file}")" '. + {id: $id}' "${json_file}" >"${tmp_file}"
    json_file="${tmp_file}"

    status_code="$(curl -sS -o /dev/null -w "%{http_code}" -X PUT -H 'Content-Type: application/json' \
      -u "${NEXUS_USER}:${NEXUS_PASSWORD}" -d "@${json_file}" "${NEXUS_HOST}/service/rest/v1/security/ldap/${name// /%20}")"
    if [[ "${status_code}" -ne 204 ]]; then
      error "Could not update LDAP '${name}'. Http response code '${status_code}'."
    fi
  else
    status_code="$(curl -sS -o /dev/null -w "%{http_code}" -X POST -H 'Content-Type: application/json' \
      -u "${NEXUS_USER}:${NEXUS_PASSWORD}" -d "@${json_file}" "${NEXUS_HOST}/service/rest/v1/security/ldap")"
    if [[ "${status_code}" -ne 201 ]]; then
      error "Could not create LDAP '${name}'. Http response code '${status_code}'."
    fi
  fi

  echo "LDAP '${name}' configured. Http response code '${status_code}'."
fi


echo "Configuring tasks..."
for json_file in "${CONFIG_DIR}"/conf/*-task.json; do
  if [[ -f "${json_file}" ]]; then
    name="$(jq -r '.name' "${json_file}")"

    status_code=$(curl -sS -o /dev/null -w "%{http_code}" -X POST -H 'Content-Type: application/json' \
      -u "${NEXUS_USER}:${NEXUS_PASSWORD}" -d "@${json_file}" "${NEXUS_HOST}/service/rest/v1/script/task/run")
    if [[ "${status_code}" -ne 200 ]]; then
      error "Could not configure task '${name}'. Http response code '${status_code}'."
    fi

    echo "Task '${name}' configured. Http response code '${status_code}'."
  fi
done

echo "Nexus3 configured successfully!"
