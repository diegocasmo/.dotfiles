#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Click to toggle
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Copy to clipboard markdown template for details/summary using GitLab's markdown
# @raycast.author Diego Castillo

echo -n "
<details>
  <summary>Click to toggle</summary>

</details>" | pbcopy
