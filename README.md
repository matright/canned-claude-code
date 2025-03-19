# Canned Claude Code

A Docker container for running Claude Code CLI without installing it directly on your system.

## What is Claude Code?

[Claude Code](https://docs.anthropic.com/en/docs/agents-and-tools/claude-code/overview) is Anthropic's official CLI tool for using Claude to assist with software engineering tasks. This container packages Claude Code so you can use it in any environment that has Docker installed.

## Prerequisites

- Docker installed on your system
- Authentication configured with `claude login` (will be shared from your host system)

## Setup

1. Clone this repository
2. Make the script executable: `chmod +x run-claude-code.sh`

## Usage

Run Claude Code in your current directory:

```bash
./run-claude-code.sh [COMMAND]
```

You can pass any Claude Code CLI arguments:

```bash
./run-claude-code.sh --help
./run-claude-code.sh -p "analyze this code"
```

The script will:
1. Build the Docker image if it doesn't exist
2. Mount your local Claude authentication from ~/.claude
3. Mount your current directory to `/workspace` in the container
4. Run Claude Code with any arguments you provide

## Benefits

- No need to install Node.js or npm on your host system
- Consistent environment across different machines
- Easy to update by rebuilding the Docker image

## License

See the [LICENSE](./LICENSE) file for details.
