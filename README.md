# ah-mcp-docker
Docker build for ah-mcp (Albert Heijn MCP)

## Image

This repository builds a container image for [`mrserzhan/ah-mcp`](https://github.com/mrserzhan/ah-mcp) and publishes it to GHCR:

- `ghcr.io/nphmuller/ah-mcp` for this repository
- `ghcr.io/<your-owner>/ah-mcp` if you reuse this setup in another repository

The default container command starts ah-mcp in remote Streamable HTTP mode:

```bash
ah-mcp --transport streamable-http --remote
```

## Runtime configuration

### Environment variables

The image sets these defaults (override with `-e`):

- `AH_MCP_PORT=3000`
- `AH_CALLBACK_PORT=9876`
- `AH_REMOTE=true`
- `AH_TOKENS_PATH=/data/tokens.json`

You can also pass other upstream `ah-mcp` environment variables (for example `AH_CALLBACK_HOST`, `AH_MCP_BASE_URL`, `AH_MCP_TOKEN`) as needed.

### Ports

The container exposes:

- `3000` for MCP server traffic
- `9876` for OAuth callback flow

### Volume

The image declares:

- `/data` to persist auth token storage (`AH_TOKENS_PATH=/data/tokens.json`)
