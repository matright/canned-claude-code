FROM node:20-slim

# Install git (optional but recommended for many workflows)
RUN apt-get update && apt-get install -y \
    git \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Install Claude Code globally
RUN npm install -g @anthropic-ai/claude-code

# Create working directory
WORKDIR /app

# Set default command to claude
CMD ["claude"]
