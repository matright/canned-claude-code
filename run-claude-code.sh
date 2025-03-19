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
if [ ! -z "${ANTHROPIC_API_KEY}" ]; then
  ENV_VARS="$ENV_VARS -e ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY}"
  ENV_VARS="$ENV_VARS -e CLAUDE_CONFIG_DIR=/root/.claude"
fi

# Run Claude Code in a container
# Mount current directory and authentication credentials
docker run --rm -it \
  -v "$PWD:/app" \
  -v "$HOME/.claude:/root/.claude" \
  $ENV_VARS \
  -w /app \
  claude-code-image claude "$@"


