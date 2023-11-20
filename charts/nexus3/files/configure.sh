#!/usr/bin/env bash
set -eu

function error() {
  msg="ERROR: $*"
  >&2 echo "${msg}"
  echo "${msg}" > "${TERMINATION_LOG}"
  exit 1
}

TERMINATION_LOG="${TERMINATION_LOG:-/dev/termination-log}"
nexus_host="http://localhost:8081"
root_user="admin"
base_dir="/opt/sonatype/nexus"
out_file="/tmp/out.json"
tmp_file="/tmp/tmp.json"

echo "Configuring Nexus3..."

root_password="${NEXUS_SECURITY_INITIAL_PASSWORD:-}"

if [[ -z "${root_password:-}" ]]
then
  error "No root password was provided."
fi

while /bin/true
do
  if [[ "$(curl -s -o /dev/null -w "%{http_code}" "${nexus_host}/service/rest/v1/status")" -ne "200" ]]
  then
    echo "Waiting for Nexus..."
    sleep 15
    continue
  fi

  json_file="${base_dir}/conf/anonymous.json"
  if [[ -f "${json_file}" ]]
  then
    echo "Updating anonymous access..."

    status_code="$(curl -s -o /dev/null -w "%{http_code}" -X PUT -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "@${json_file}" "${nexus_host}/service/rest/v1/security/anonymous")"
    if [[ "${status_code}" -ne 200 ]]
    then
      error "Could not configure anonymous access."
    fi

    echo "Anonymous access configured."
  fi

  json_file="${base_dir}/conf/realms.json"
  if [[ -f "${json_file}" ]]
  then
    echo "Updating realms..."

    status_code="$(curl -s -o /dev/null -w "%{http_code}" -X PUT -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "@${json_file}" "${nexus_host}/service/rest/v1/security/realms/active")"
    if [[ "${status_code}" -ne 204 ]]
    then
      error "Could not configure realms."
    fi

    echo "Realms configured."
  fi

  for json_file in "${base_dir}"/conf/*-role.json
  do
    if [[ -f "${json_file}" ]]
    then
      id="$(grep -Pio '(?<="id":)\s*\"[^"]+\"' "${json_file}" | xargs)"
      source="$(grep -Pio '(?<="source":)\s*\"[^"]+\"' "${json_file}" | xargs)"
      echo "Updating role '${id}'..."

      status_code=$(curl -s -o /dev/null -w "%{http_code}" -X GET -H 'Content-Type: application/json' -u "${root_user}:${root_password}" "${nexus_host}/service/rest/v1/security/roles/${id}?source=${source}")
      if [[ "${status_code}" -eq 200 ]]
      then
        status_code="$(curl -s -o /dev/null -w "%{http_code}" -X PUT -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "@${json_file}" "${nexus_host}/service/rest/v1/security/roles/${id}")"
        if [[ "${status_code}" -ne 204 ]]
        then
          error "Could not configure role."
        fi
      else
        status_code="$(curl -s -o /dev/null -w "%{http_code}" -X POST -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "@${json_file}" "${nexus_host}/service/rest/v1/security/roles")"
        if [[ "${status_code}" -ne 200 ]]
        then
          error "Could not configure role."
        fi
      fi

      echo "Role configured."
    fi
  done

  for json_file in "${base_dir}"/conf/*-user.json
  do
    if [[ -f "${json_file}" ]]
    then
      id="$(grep -Pio '(?<="userId":)\s*\"[^"]+\"' "${json_file}" | xargs)"
      source="$(grep -Pio '(?<="source":)\s*\"[^"]+\"' "${json_file}" | xargs)"
      echo "Updating user '${id}'..."

      status_code=$(curl -s -o "${out_file}" -w "%{http_code}" -X GET -H 'Content-Type: application/json' -u "${root_user}:${root_password}" "${nexus_host}/service/rest/v1/security/users/?userId=${id}&source=${source}")
      if [[ "${status_code}" -eq 200 ]] && [[ -n "$(grep -r 'userId' ${out_file} || true)" ]]
      then
        status_code="$(curl -s -o /dev/null -w "%{http_code}" -X PUT -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "@${json_file}" "${nexus_host}/service/rest/v1/security/users/${id}")"
        if [[ "${status_code}" -ne 204 ]]
        then
          error "Could not configure user."
        fi
      else
        password="$(echo "${RANDOM}" | md5sum | head -c 20)"
        sed "s/\"userId\"/\"password\":\"${password}\",\"userId\"/" "${json_file}" > "${tmp_file}"
        json_file="${tmp_file}"

        status_code="$(curl -s -o /dev/null -w "%{http_code}" -X POST -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "@${json_file}" "${nexus_host}/service/rest/v1/security/users")"
        if [[ "${status_code}" -ne 200 ]]
        then
          error "Could not configure user."
        fi
      fi

      rm -f "${tmp_file}"
      echo "User configured."
    fi
  done

  json_file="${base_dir}/conf/anonymous-user.json"
  if [[ -f "${json_file}" ]]
  then
    echo "Configuring anonymous user..."

    status_code="$(curl -s -o /dev/null -w "%{http_code}" -X PUT -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "@${json_file}" "${nexus_host}/service/rest/v1/security/users/anonymous")"
    if [[ "${status_code}" -ne 204 ]]
    then
      error "Could not configure anonymous user."
    fi

    echo "Anonymous user configured."
  fi

  json_file="${base_dir}/conf/ldap.json"
  if [[ -f "${json_file}" ]]
  then
    cp -f "${json_file}" "${tmp_file}"
    json_file="${tmp_file}"

    if [[ -f "${base_dir}/secret/ldap.password" ]]
    then
      ldap_password=$(cat "${base_dir}/secret/ldap.password" | sed 's|"|\\"|g;s|/|\\/|g')
      sed -i "s/PASSWORD/${ldap_password}/g" "${json_file}"
    fi

    name="$(grep -Pio '(?<="name":)\s*\"[^"]+\"' "${json_file}" | xargs)"

    status_code=$(curl -s -o "${out_file}" -w "%{http_code}" -X GET -H 'Content-Type: application/json' -u "${root_user}:${root_password}" "${nexus_host}/service/rest/v1/security/ldap/${name// /%20}")
    if [[ "${status_code}" -eq 200 ]]
    then
      echo "Updating LDAP configuration for '${name}'..."

      id="$(grep -Pio '(?<="id"\s:)\s*\"[^"]+\"' "${out_file}" | xargs)"
      sed -i "s/{\"/{\"id\":\"${id}\",\"/g" "${json_file}"

      status_code="$(curl -s -o /dev/null -w "%{http_code}" -X PUT -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "@${json_file}" "${nexus_host}/service/rest/v1/security/ldap/${name// /%20}")"
      if [[ "${status_code}" -ne 204 ]]
      then
        error "Could not configure LDAP."
      fi
    else
      echo "Adding LDAP configuration for '${name}'..."

      status_code="$(curl -s -o /dev/null -w "%{http_code}" -X POST -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "@${json_file}" "${nexus_host}/service/rest/v1/security/ldap")"
      if [[ "${status_code}" -ne 201 ]]
      then
        error "Could not configure LDAP."
      fi
    fi

    rm -f "${json_file}"
    echo "LDAP configured."
  fi

  for json_file in "${base_dir}"/conf/*-blobstore.json
  do
    if [[ -f "${json_file}" ]]
    then
      type="$(grep -Pio '(?<="type":)\s*\"[^"]+\"' "${json_file}" | head -1 | xargs)"
      if [[ "${type}" = "s3" ]]
      then
        name="$(grep -Pio '(?<="name":)(\s*\"[^"]+\")(?=,"type":\"s3\")' "${json_file}" | xargs)"
      else
        name="$(grep -Pio '(?<="name":)\s*\"[^"]+\"' "${json_file}" | xargs)"
      fi
      echo "Updating blob store '${name}'..."

      status_code=$(curl -s -o /dev/null -w "%{http_code}" -X GET -H 'Content-Type: application/json' -u "${root_user}:${root_password}" "${nexus_host}/service/rest/v1/blobstores/${type}/${name}")
      if [[ "${status_code}" -eq 200 ]]
      then
        status_code="$(curl -s -o /dev/null -w "%{http_code}" -X PUT -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "@${json_file}" "${nexus_host}/service/rest/v1/blobstores/${type}/${name}")"
        if [[ "${status_code}" -ne 204 ]]
        then
          error "Could not configure blob store."
        fi
      else
        status_code="$(curl -s -o /dev/null -w "%{http_code}" -X POST -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "@${json_file}" "${nexus_host}/service/rest/v1/blobstores/${type}")"
        if [[ "${status_code}" -ne 204 ]] && [[ "${status_code}" -ne 201 ]]
        then
          error "Could not configure blob store."
        fi
      fi

      echo "Blob store configured."
    fi
  done

  for script_file in "${base_dir}"/conf/*.groovy
  do
    echo "Updating script ${script_file}."

    name="$(basename "${script_file}" .groovy)"
    content="$(sed 's/\"/\\\"/g' "${script_file}" | sed ':a;N;$!ba;s/\n/\\n/g')"
    data="{ \"name\": \"${name}\", \"type\": \"groovy\", \"content\": \"${content}\" }"

    status_code=$(curl -s -o /dev/null -w "%{http_code}" -X GET -u "${root_user}:${root_password}" "${nexus_host}/service/rest/v1/script/${name}")
    if [[ "${status_code}" -eq 200 ]]
    then
      status_code=$(curl -s -o /dev/null -w "%{http_code}" -X PUT -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "${data}" "${nexus_host}/service/rest/v1/script/${name}")
    else
      status_code=$(curl -s -o /dev/null -w "%{http_code}" -X POST -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "${data}" "${nexus_host}/service/rest/v1/script")
    fi

    if [[ "${status_code}" -ne 204 ]]
    then
      error "Could not update script ${name}."
    fi

    echo "Script ${script_file} updated."
  done

  for json_file in "${base_dir}"/conf/*-cleanup.json
  do
    if [[ -f "${json_file}" ]]
    then
      echo "Configuring cleanup policy..."

      status_code=$(curl -s -o /dev/null -w "%{http_code}" -X POST -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "@${json_file}" "${nexus_host}/service/rest/v1/script/cleanup/run")
      if [[ "${status_code}" -ne 200 ]]
      then
        error "Could not set cleanup policy."
      fi

      echo "Cleanup policy configured."
    fi
  done

  for json_file in "${base_dir}"/conf/*-repo.json
  do
    if [[ -f "${json_file}" ]]
    then
      echo "Configuring repo..."

      cp -f "${json_file}" "${tmp_file}"
      json_file="${tmp_file}"

      repo_name="$(grep -Pio '(?<="name":)\s*\"[^"]+\"' "${json_file}" | xargs)"
      repo_password_file="${base_dir}/secret/repo-credentials/${repo_name}"
      if [[ -f "${repo_password_file}" ]]
      then
        repo_password="$(cat "${repo_password_file}")"
        sed -i "s/PASSWORD/${repo_password}/g" "${json_file}"
      fi

      status_code=$(curl -s -o /dev/null -w "%{http_code}" -X POST -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "@${json_file}" "${nexus_host}/service/rest/v1/script/repo/run")
      if [[ "${status_code}" -ne 200 ]]
      then
        error "Could not set repo."
      fi

      rm -f "${json_file}"
      echo "Repo configured."
    fi
  done

  for json_file in "${base_dir}"/conf/*-task.json
  do
    if [[ -f "${json_file}" ]]
    then
      status_code=$(curl -s -o /dev/null -w "%{http_code}" -X POST -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "@${json_file}" "${nexus_host}/service/rest/v1/script/task/run")
      if [[ "${status_code}" -ne 200 ]]
      then
        error "Could not set task."
      fi

      echo "Task configured."
    fi
  done

  echo "Nexus3 configured successfully!"
  exit 0
done
