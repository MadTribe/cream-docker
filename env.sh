#!/usr/bin/env bash
THIS_PWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export PUBLIC_HOST=localhost

export RASPBERRY_CREAM=$THIS_PWD/../raspberry-cream

# Set tooling paths

source $THIS_PWD/init-tools.sh
