# Canned Claude Code

A Docker container for running Claude Code CLI without installing it directly on your system.

## What is Claude Code?

Claude Code is Anthropic's official CLI tool for using Claude to assist with software engineering tasks. This container packages Claude Code so you can use it in any environment that has Docker installed.

## Prerequisites

- Docker installed on your system
- Anthropic API key (if you don't have one, get it from [Anthropic's console](https://console.anthropic.com/))

## Setup

1. Clone this repository
2. Make the script executable: `chmod +x run-claude-code.sh`
3. Set your Anthropic API key as an environment variable:
   ```bash
   export ANTHROPIC_API_KEY=your_api_key_here
   ```

## Usage

Run Claude Code in your current directory:

```bash
./run-claude-code.sh
```

You can pass any Claude Code CLI arguments:

```bash
./run-claude-code.sh --help
./run-claude-code.sh "analyze this code"
```

The script will:
1. Build the Docker image if it doesn't exist
2. Pass your Anthropic API key to the container
3. Mount your current directory to `/app` in the container
4. Run Claude Code with any arguments you provide

## Benefits

- No need to install Node.js or npm on your host system
- Consistent environment across different machines
- Easy to update by rebuilding the Docker image

## License

See the [LICENSE](./LICENSE) file for details.