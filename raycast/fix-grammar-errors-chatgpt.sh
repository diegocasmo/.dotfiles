#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title fix-grammar-errors-chatgpt
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author Diego Castillo


echo -n "Fix the grammar errors in this text only. Do not reword. The output must be in markdown.

\`\`\` md
\`\`\`" | pbcopy

