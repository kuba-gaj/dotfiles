hyprctl dispatch focuswindow $(if [[ $(hyprctl activewindow -j | jq ."floating") == "true" ]]; then echo "tiled"; else echo "floating"; fi)
