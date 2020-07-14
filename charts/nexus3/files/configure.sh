#!/usr/bin/env sh
set -e

nexus_host="http://localhost:8081"
root_user="admin"
base_dir="/opt/sonatype/nexus"

if [ -f "${base_dir}/secret/root.password" ]
then
  root_password="$(cat "${base_dir}/secret/root.password")"
fi

if [ -z "${root_password}" ]
then
  echo "No root password was provided."
  exit 0
fi

while /bin/true
do
  if [ "$(curl -s -o /dev/null -w "%{http_code}" "${nexus_host}/service/rest/v1/status")" -ne "200" ]
  then
    echo "Waiting for Nexus..."
    sleep 15
    continue
  fi

  if [ -f "/nexus-data/admin.password" ]
  then
    default_password="$(cat /nexus-data/admin.password)"
  fi

  if [ -n "${default_password}" ] && [ -n "${root_password}" ]
  then
    echo "Updating root password."

    status_code=$(curl -s -o /dev/null -w "%{http_code}" -X PUT -H 'Content-Type: text/plain' -u "${root_user}:${default_password}" -d "${root_password}" "${nexus_host}/service/rest/beta/security/users/${root_user}/change-password")
    if [ "${status_code}" -ne 204 ]
    then
      echo "Could not update the root user's password" >&2
      exit 1
    fi

    echo "The root user's password was updated sucessfully."
    rm -f /nexus-data/admin.password
  fi

  json_file="${base_dir}/conf/anonymous.json"
  if [ -f "${json_file}" ]
  then
    status_code="$(curl -s -o /dev/null -w "%{http_code}" -X PUT -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "@${json_file}" "${nexus_host}/service/rest/beta/security/anonymous")"
    if [ "${status_code}" -ne 200 ]
    then
      echo "Could not set anonymous." >&2
      exit 1
    fi

    echo "Anonymous access configured."
  fi

  json_file="${base_dir}/conf/realms.json"
  if [ -f "${json_file}" ]
  then
    status_code="$(curl -s -o /dev/null -w "%{http_code}" -X PUT -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "@${json_file}" "${nexus_host}/service/rest/beta/security/realms/active")"
    if [ "${status_code}" -ne 204 ]
    then
      echo "Could not set realms." >&2
      exit 1
    fi

    echo "Realms configured."
  fi

  for script_file in ${base_dir}/conf/*.groovy
  do
    echo "Updating script ${script_file}."

    name="$(basename "${script_file}" .groovy)"
    content="$(sed 's/\"/\\\"/g' "${script_file}" | sed ':a;N;$!ba;s/\n/\\n/g')"
    data="{ \"name\": \"${name}\", \"type\": \"groovy\", \"content\": \"${content}\" }"

    status_code=$(curl -s -o /dev/null -w "%{http_code}" -X GET -u "${root_user}:${root_password}" "${nexus_host}/service/rest/v1/script/${name}")
    if [ "${status_code}" -eq 200 ]
    then
      status_code=$(curl -s -o /dev/null -w "%{http_code}" -X PUT -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "${data}" "${nexus_host}/service/rest/v1/script/${name}")
    else
      status_code=$(curl -s -o /dev/null -w "%{http_code}" -X POST -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "${data}" "${nexus_host}/service/rest/v1/script")
    fi

    if [ "${status_code}" -ne 204 ]
    then
      echo "Could not update script ${name}." >&2
      exit 1
    fi
  done

  json_file="${base_dir}/conf/ldap.json"
  if [ -f "${json_file}" ]
  then
    if [ -f "${base_dir}/secret/ldap.password" ]
    then
      ldap_password=$(cat "${base_dir}/secret/ldap.password")
      temp_file="/tmp/ldap.json"
      sed "s/PASSWORD/${ldap_password}/g" "${json_file}" > "${temp_file}"
      json_file="${temp_file}"
    fi

    status_code=$(curl -s -o /dev/null -w "%{http_code}" -X POST -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "@${json_file}" "${nexus_host}/service/rest/v1/script/ldap/run")
    if [ "${status_code}" -ne 200 ]
    then
      echo "Could not set LDAP." >&2
      exit 1
    fi

    if [ -f "${temp_file}" ]
    then
      rm -f "${temp_file}"
    fi

    echo "LDAP configured."
  fi

  for json_file in ${base_dir}/conf/*-cleanup.json
  do
    if [ -f "${json_file}" ]
    then
      status_code=$(curl -s -o /dev/null -w "%{http_code}" -X POST -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "@${json_file}" "${nexus_host}/service/rest/v1/script/cleanup/run")
      if [ "${status_code}" -ne 200 ]
      then
        echo "Could not set cleanup policy." >&2
        exit 1
      fi

      echo "Cleanup policy configured."
    fi
  done

  for json_file in ${base_dir}/conf/*-repo.json
  do
    if [ -f "${json_file}" ]
    then
      status_code=$(curl -s -o /dev/null -w "%{http_code}" -X POST -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "@${json_file}" "${nexus_host}/service/rest/v1/script/repo/run")
      if [ "${status_code}" -ne 200 ]
      then
        echo "Could not set repo." >&2
        exit 1
      fi

      echo "Repo configured."
    fi
  done

  for json_file in ${base_dir}/conf/*-task.json
  do
    if [ -f "${json_file}" ]
    then
      status_code=$(curl -s -o /dev/null -w "%{http_code}" -X POST -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "@${json_file}" "${nexus_host}/service/rest/v1/script/task/run")
      if [ "${status_code}" -ne 200 ]
      then
        echo "Could not set task." >&2
        exit 1
      fi

      echo "Task configured."
    fi
  done

  json_file="${base_dir}/conf/metrics.json"
  if [ -f "${json_file}" ]
  then
    status_code=$(curl -s -o /dev/null -w "%{http_code}" -X POST -H 'Content-Type: application/json' -u "${root_user}:${root_password}" -d "@${json_file}" "${nexus_host}/service/rest/v1/script/metrics/run")
    if [ "${status_code}" -ne 200 ]
    then
      echo "Could not set metrics access." >&2
      exit 1
    fi

    echo "Metrics access configured."
  fi

  echo "Configuration run successfully!"
  exit 0
done &
