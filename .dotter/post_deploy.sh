#!/usr/bin/env sh
echo "Post deploy script"

# todo: create symlinks for:
# - *.flags files
# - *.luarc files
#
# example: make it executable to run not sh
#!/bin/bash
# SYSTEMD_ROOT="${HOME}/.config/systemd/user"
#
# function enable_service() {
#   if [[ -f "${SYSTEMD_ROOT}/$1" ]] && ! [[ -f "${SYSTEMD_ROOT}/multi-user.target.wants/$1" ]]; then
#     echo "Enabling and starting systemd unit $1"
#     systemctl --user --now enable $1
#   fi
# }
#
# {{ #if dotter.packages.taskwarrior }}
# enable_service task-sync.timer
# {{ /if }}
