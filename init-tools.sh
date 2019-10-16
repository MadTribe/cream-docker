#!/usr/bin/env bash

###################################################################
#
# This script allows required tools to be configured by Jenkins.
# Otherwise local system defalts will be used.
#
###################################################################


function configure_tool {
  local NAME_OF_VAR_TO_CHECK=$1
  local TOOL_NAME=$2

  if [ -z "${!NAME_OF_VAR_TO_CHECK}" ]; then
    export "${NAME_OF_VAR_TO_CHECK}"=$(which $TOOL_NAME)

  fi

  if [ -z "${!NAME_OF_VAR_TO_CHECK}" ]; then
      echo "Please either install \"$TOOL_NAME\" or set $NAME_OF_VAR_TO_CHECK to its location."
  else
    if [ -x "$(command -v ${!NAME_OF_VAR_TO_CHECK})" ]; then
        echo "${!NAME_OF_VAR_TO_CHECK} - OK"
    else
        echo "${!NAME_OF_VAR_TO_CHECK} does not exist"
        exit 1;
    fi
  fi

}

configure_tool MVN_TOOL mvn
configure_tool GROOVY_TOOL groovy
configure_tool DOCKER_TOOL docker
configure_tool COMPOSE_TOOL docker-compose
configure_tool GIT_TOOL git
configure_tool JAVA_TOOL java
