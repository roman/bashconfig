#!/bin/bash

export VIRTUAL_ENV_DISABLE_PROMPT=1
if [[ $(command -v virtualenvwrapper.sh 2>&1 /dev/null) ]]; then
    source `which virtualenvwrapper.sh`
fi
