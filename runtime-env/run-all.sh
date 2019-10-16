#!/usr/bin/env bash

set -e

_PWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $_PWD/../env.sh

pushd $_PWD

$COMPOSE_TOOL stop
$COMPOSE_TOOL rm -f

#open $_PWD/../docker-src/help-center/src/index.html &

$COMPOSE_TOOL up

popd
