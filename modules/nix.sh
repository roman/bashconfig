#!/bin/bash

# Add nix profile to current shell
if [[ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]]; then
    . $HOME/.nix-profile/etc/profile.d/nix.sh
fi

# Setup nixpkgs for development of new pkgs
if [[ -z $NIXPKGS ]] && [[ -d $HOME/.nixpkgs ]]; then
    export NIXPKGS=$HOME/.nixpkgs
    alias nix_home="cd $NIXPKGS"
fi
