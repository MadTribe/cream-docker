#!/usr/bin/env bash

_TARGET=$1
CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp -R $RASPBERRY_CREAM/{README.md,config,install.sh,requirements.txt,run-calibrate.sh,run-dev.sh,source,testdata} $_TARGET