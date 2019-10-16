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

set -e -v

PWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$PWD/env.sh"
source "$PWD/tools/build-env.sh"


build_project_and_image "$1"

