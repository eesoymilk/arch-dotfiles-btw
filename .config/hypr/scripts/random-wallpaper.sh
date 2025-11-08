#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"

# Get list of monitors
MONITORS=$(hyprctl monitors -j | jq -r '.[].name')

# Count monitors
MONITOR_COUNT=$(echo "$MONITORS" | wc -l)

# Get all available wallpapers
WALLPAPERS=($(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \)))

# Check if wallpapers were found
if [ ${#WALLPAPERS[@]} -eq 0 ]; then
    echo "No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

# If there's only 1 wallpaper, use it for all monitors
if [ ${#WALLPAPERS[@]} -eq 1 ]; then
    WALLPAPER="${WALLPAPERS[0]}"
    hyprctl hyprpaper preload "$WALLPAPER" > /dev/null

    while IFS= read -r MONITOR; do
        hyprctl hyprpaper wallpaper "$MONITOR,$WALLPAPER" > /dev/null
    done <<< "$MONITORS"
else
    # Shuffle wallpapers and set one for each monitor
    SHUFFLED=($(printf '%s\n' "${WALLPAPERS[@]}" | shuf))

    INDEX=0
    while IFS= read -r MONITOR; do
        WALLPAPER="${SHUFFLED[$INDEX]}"

        # Preload the wallpaper
        hyprctl hyprpaper preload "$WALLPAPER" > /dev/null

        # Set the wallpaper on the specific monitor
        hyprctl hyprpaper wallpaper "$MONITOR,$WALLPAPER" > /dev/null

        # Cycle back to start if we run out of wallpapers
        INDEX=$(((INDEX + 1) % ${#SHUFFLED[@]}))
    done <<< "$MONITORS"
fi

# Optional: Unload previous wallpapers to save memory (comment out if you want to keep them loaded)
# hyprctl hyprpaper unload all
