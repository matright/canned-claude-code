#!/bin/bash
set -e

# Build the Docker image if it doesn't exist
if ! docker image inspect claude-code-image >/dev/null 2>&1; then
  echo "Building Claude Code Docker image..."
  docker build -t claude-code-image .
fi

# Environment variables to pass to the container
ENV_VARS=""

# Pass Anthropic API key if exists
# if [ ! -z "${ANTHROPIC_API_KEY}" ]; then
#  ENV_VARS="$ENV_VARS -e ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY}"
ENV_VARS="$ENV_VARS -e CLAUDE_CONFIG_DIR=/home/node/.claude"
# fi

# Run Claude Code in a container
# Mount current directory and authentication credentials
docker run --rm -it --name claude-code \
  -v "$PWD:/workspace" \
  -v "$HOME/.claude:/home/node/.claude" \
  $ENV_VARS \
  -w /workspace \
  claude-code-image claude "$@"


# docker run --rm -it --name claude-code -v "$PWD:/workspace" -v "$HOME/.claude:/home/node/.claude" -e CLAUDE_CONFIG_DIR=/home/node/.claude -w /workspace claude-code-image bash
