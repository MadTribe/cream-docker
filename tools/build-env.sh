#!/usr/bin/env bash
#################################################################################################################
#  This Script compiles and builds all the docker images needed to run this system.
#  The scripts to build each component are stored under the docker-src folder.
#  In each component sub-folder scripts will be run in the following order:
#
#           0service-env    - to set environment variables for building that component.
#           1compile.sh     - to run the build process and copy the result to a folder in ./target
#   Then the Dockerfile, which is also copied across to ./target/<component name> is run to build an image.
#
#   Components are added to this build by repeated calls to the "build_project_and_image" function
#   at the end of this script.
##################################################################################################################

set -e

PWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

TARGET_FOLDER=$PWD/../target
IMAGE_BUILDER_FOLDER=$PWD/../docker-images-src


clean() {
    local _DOCKER_PROJECT=$1
    local _DOCKER_SOURCE=$IMAGE_BUILDER_FOLDER/$_DOCKER_PROJECT
    source "$_DOCKER_SOURCE/0service-env"
    $DOCKER_TOOL rmi "$IMAGE_NAME" -f || echo "$IMAGE_NAME does not need to be deleted."
}

build_project() {
  local _DOCKER_PROJECT=$1
  local _TARGET=$TARGET_FOLDER/$_DOCKER_PROJECT
  local _DOCKER_SOURCE=$IMAGE_BUILDER_FOLDER/$_DOCKER_PROJECT
  mkdir -p "$_TARGET"
  source "$_DOCKER_SOURCE/0service-env"
  "$_DOCKER_SOURCE/1compile.sh" "$_TARGET"
  echo "**making $_DOCKER_SOURCE"
  cp "$_DOCKER_SOURCE/Dockerfile" "$_TARGET"
}

build_image() {
    local _IMAGE_NAME=$1
    local _DOCKER_PROJECT=$2
    local _TARGET=$TARGET_FOLDER/$_DOCKER_PROJECT
    pushd "$_TARGET"
    echo "$DOCKER_TOOL" build -t "$_IMAGE_NAME" .
    "$DOCKER_TOOL" build -t "$_IMAGE_NAME" .
    popd
}

build_project_and_image() {
    PROJECT=$1

    clean "$PROJECT"
    echo "after clean"
    build_project "$PROJECT"
    echo "after build"
    build_image "$IMAGE_NAME" "$PROJECT"
}

safe_build_project_and_image() {
    PROJECT=$1

    echo "after clean"
    build_project "$PROJECT"
    echo "after build"
    build_image "$IMAGE_NAME" "$PROJECT"
}