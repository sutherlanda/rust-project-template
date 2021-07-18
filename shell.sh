#!/bin/zsh
nix-shell -A 'shell' ./nix/default.nix --command "exec zsh; return" "$@"
