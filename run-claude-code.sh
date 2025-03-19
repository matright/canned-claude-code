#!/bin/bash
set -e

# Build the Docker image if it doesn't exist
if ! docker image inspect claude-code-image >/dev/null 2>&1; then
  echo "Building Claude Code Docker image..."
  docker build -t claude-code-image .
fi

# Run Claude Code in a container
# Mount current directory and authentication credentials
docker run --rm -it --name claude-code \
  -v "$PWD:/workspace" \
  -w /workspace \
  -v "$HOME/.claude:/home/node/.claude" \
  -e CLAUDE_CONFIG_DIR=/home/node/.claude \
  claude-code-image claude "$@"
