#!/bin/bash

# Get the current volume level
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep 'Volume:' | awk '{print $5}' | tr -d '%')

# Calculate the length of the ASCII bar
bar_length=10
filled_length=$((volume * bar_length / 100))

# Create the ASCII bar
bar=$(printf '%*s' "$filled_length" | tr ' ' '█')
empty_bar=$(printf '%*s' "$((bar_length - filled_length))" | tr ' ' '░')
ascii_bar="$bar$empty_bar"

# Print the volume level and the ASCII bar
echo "Volume: $volume% $ascii_bar"

