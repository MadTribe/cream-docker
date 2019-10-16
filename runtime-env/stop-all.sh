#!/usr/bin/env bash

set -e

_PWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $_PWD/../env.sh

pushd $_PWD

docker-compose down

popd
