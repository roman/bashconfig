#!/bin/bash

if [[ $(command -v keychain 2>&1 /dev/null) ]]; then
   keychain
   source "$HOME/.keychain/$(hostname)-sh"
fi
