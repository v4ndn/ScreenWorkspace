#!/bin/bash
monitor="$(hyprctl activeworkspace -j | grep -o '"monitorID": [0-9]*' | awk '{print $2}')"

if [[ $1 == "move" ]]; then
    workspace=$((monitor + monitor * 10 + $2))
    hyprctl dispatch movetoworkspace $workspace
else
    workspace=$((monitor + monitor * 10 + $1))
    hyprctl dispatch workspace $workspace
fi
