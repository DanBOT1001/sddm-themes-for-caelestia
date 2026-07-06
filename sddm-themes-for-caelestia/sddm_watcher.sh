#!/usr/bin/env bash
# Watch for the trigger file
while true; do
    if [ -f /tmp/sddm_theme_trigger ]; then
        THEME=$(cat /tmp/sddm_theme_trigger)
        # Apply the theme with root privileges
        pkexec sed -i "s/^Current=.*/Current=$THEME/" /etc/sddm.conf
        # Clear the trigger
        rm /tmp/sddm_theme_trigger
    fi
    sleep 1
done
