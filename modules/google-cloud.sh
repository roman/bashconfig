#!/bin/bash

if [[ -z $GOOGLE_CLOUD_SDK_HOME ]]; then
  export GOOGLE_CLOUD_SDK_HOME=$HOME/Library/google-cloud-sdk
  if [[ -d $GOOGLE_CLOUD_SDK_HOME ]]; then
    # The next line updates PATH for the Google Cloud SDK.
    source $GOOGLE_CLOUD_SDK_HOME/path.bash.inc
    # The next line enables bash completion for gcloud.
    source $GOOGLE_CLOUD_SDK_HOME/completion.bash.inc
  fi
fi
