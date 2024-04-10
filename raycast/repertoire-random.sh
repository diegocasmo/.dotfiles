#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title repertoire-random
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Randomly select a song from my repertoire to practice.
# @raycast.author Diego Castillo

# Define the list of songs
songs=("All of Me" "Autumn Leaves" "Blue Bossa" "Tenor Madness" "Take The A Train" "All The Things You Are")

# Select a random song from the list
selected_song=${songs[$RANDOM % ${#songs[@]}]}

# Print the selected song with the specified format
echo "Selected song: $selected_song"
