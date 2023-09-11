#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title today
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Copy to clipboard today's date
# @raycast.author Diego Castillo

date +'%Y-%m-%d' | pbcopy
