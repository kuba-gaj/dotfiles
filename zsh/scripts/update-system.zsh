#!/bin/zsh

if [[ -o !interactive ]]; then
    echo "This script is meant to be run interactively, try `upd` instead"
    exit 1
fi

# set -e # exit on error
echo "##### Removing orphans #####"
# allow this to fail (if there are no orphans)
yay --remove --recursive $(yay --quiet --query --deps --unrequired)
# pacman-remove-orphans
yay -Pw # print news if any
echo "##### Updating repo and AUR packages #####"
yay -Syu --devel                   # update repo and AUR packages, including -git packages
yay -S --needed neovim-nightly-bin # update the nightly neovim
echo "##### Cleaning znap eval cache #####"
\rm -f "$XDG_CACHE_HOME"/zsh-snap/eval/*
# echo "Cleaning cliphist"
# \rm -f "$XDG_CACHE_HOME"/cliphist/db" or *?
echo "##### Updating znap packages #####"
znap pull || true 
echo "##### Updating znap packages #####"
pipx upgrade-all
echo "##### Updating firmware #####"
fwupdmgr refresh # get firmware updates
fwupdmgr update  # install/schedule boot firmware updates if any
