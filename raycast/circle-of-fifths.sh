#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title circle-of-fifths
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Script to echo a random selection from the Circle of Fifths either clockwise or counter-clockwise
# @raycast.author Diego Castillo

# Define the Circle of Fifths in arrays, clockwise and counter-clockwise
clockwise=("C" "G" "D" "A" "E" "B" "F#" "C#")
counter_clockwise=("C" "F" "Bb" "Eb" "Ab" "Db" "Gb" "Cb")

# Randomly choose between clockwise and counter-clockwise
direction=$((RANDOM % 2))

if [ $direction -eq 0 ]; then
    # If direction is 0, choose clockwise
    echo "Direction: Clockwise"
    key=${clockwise[$((RANDOM % ${#clockwise[@]}))]}
else
    # If direction is 1, choose counter-clockwise
    echo "Direction: Counter-Clockwise"
    key=${counter_clockwise[$((RANDOM % ${#counter_clockwise[@]}))]}
fi

# Echo the chosen key
echo "Selected Key: $key"
