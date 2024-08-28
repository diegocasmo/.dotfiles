#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title fix-grammar-errors-chatgpt
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author Diego Castillo


echo -n "Please correct the grammatical errors in this text without rewording. The output should be in markdown format and presented clearly and in a friendly tone. Thank you!

\`\`\` md
\`\`\`" | pbcopy
