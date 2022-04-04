#!/usr/bin/env bash

# Utility script to run the jenkins_on_openshift4 role.

usage()
{
  cat <<USAGE_TEXT
Usage: $(basename "${BASH_SOURCE[0]}") [-h | --help] [-v | --verbose] [--target-openshift-server-url <openshift-server-url>] [--target-jenkins-namespace <jenkins-namespace>] [--jenkins-pvc-storage <storage-size>] [--jenkins-pvc-storage-class <storage-class>] [--maven-dotm2-pvc-storage <storage-size>] [--maven-dotm2-pvc-storage-class <storage-class>] [--maven-mirror <maven-mirror>] [--maven-server1 <maven-server>] [--maven-server2 <maven-server>]
Utility script to run the jenkins_on_openshift4 role.
Available options:
      --target-openshift-server-url    <openshift-server-url>  The REST API URL of the OpenShift4 server on which Jenkins is to be configured (defaults to "https://api.crc.testing:6443")
      --target-jenkins-namespace       <jenkins-namespace>     The name of the namespace in which Jenkins is to be configured (defaults to "jenkins")
  -h, --help         Print this help and exit
  -v, --verbose      Print script debug info
USAGE_TEXT
}

main()
{
  initialize
  parse_script_params "${@}"
  # call other functions here
  configure_jenkins_on_openshift4
}

configure_jenkins_on_openshift4()
{
  export ANSIBLE_ROLES_PATH=${THIS_SCRIPT_DIRECTORY}/../.ansible/roles/main/:${THIS_SCRIPT_DIRECTORY}/../.ansible/roles/external/

  # Install the dependencies of the playbook:
  ANSIBLE_ROLES_PATH=${THIS_SCRIPT_DIRECTORY}/../.ansible/roles/external/ ansible-galaxy install --role-file=${THIS_SCRIPT_DIRECTORY}/../.ansible/roles/requirements_jenkins_on_openshift4.yml --force

  ansible-playbook \
    -v \
    --inventory="localhost," \
    --connection=local \
    --extra-vars "adrianjuhl__jenkins_on_openshift4__openshift_server_url=${TARGET_OPENSHIFT_SERVER_URL}" \
    --extra-vars "adrianjuhl__jenkins_on_openshift4__openshift_namespace_jenkins=${TARGET_JENKINS_NAMESPACE}" \
    ${THIS_SCRIPT_DIRECTORY}/../.ansible/playbooks/configure_jenkins_on_openshift4.yml
}

parse_script_params()
{
  #msg "script params (${#}) are: ${@}"
  # default values of variables set from params
  TARGET_OPENSHIFT_SERVER_URL="https://api.crc.testing:6443"
  TARGET_JENKINS_NAMESPACE="jenkins"
  while [ "${#}" -gt 0 ]
  do
    case "${1-}" in
      --target-openshift-server-url)
        TARGET_OPENSHIFT_SERVER_URL="${2-}"
        shift
        ;;
      --target-jenkins-namespace)
        TARGET_JENKINS_NAMESPACE="${2-}"
        shift
        ;;
      --help | -h)
        usage
        exit
        ;;
      --verbose | -v)
        set -x
        ;;
      -?*)
        msg "Error: Unknown parameter: ${1}"
        msg "Use --help for usage help"
        abort_script
        ;;
      *) break ;;
    esac
    shift
  done
}

initialize()
{
  THIS_SCRIPT_PROCESS_ID=$$
  THIS_SCRIPT_DIRECTORY="$(dirname "$(readlink -f "${0}")")"
  initialize_abort_script_config
}

initialize_abort_script_config()
{
  # Exit shell script from within the script or from any subshell within this script - adapted from:
  # https://cravencode.com/post/essentials/exit-shell-script-from-subshell/
  # Exit with exit status 1 if this (top level process of this script) receives the SIGUSR1 signal.
  # See also the abort_script() function which sends the signal.
  trap "exit 1" SIGUSR1
}

abort_script()
{
  echo >&2 "aborting..."
  kill -SIGUSR1 ${THIS_SCRIPT_PROCESS_ID}
  exit
}

msg()
{
  echo >&2 -e "${@}"
}

# Main entry into the script - call the main() function
main "${@}"
