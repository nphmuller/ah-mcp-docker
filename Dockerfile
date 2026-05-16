FROM golang:1.23 AS builder

ARG AH_MCP_VERSION=latest
RUN CGO_ENABLED=0 GOOS=linux go install -trimpath -ldflags="-s -w" "github.com/mrserzhan/ah-mcp@${AH_MCP_VERSION}"

FROM gcr.io/distroless/base-debian12:nonroot

ENV AH_MCP_PORT=3000 \
    AH_CALLBACK_PORT=9876 \
    AH_REMOTE=true \
    AH_TOKENS_PATH=/data/tokens.json

COPY --from=builder /go/bin/ah-mcp /usr/local/bin/ah-mcp

VOLUME ["/data"]

EXPOSE 3000 9876

ENTRYPOINT ["/usr/local/bin/ah-mcp"]
CMD ["--transport", "streamable-http", "--remote"]
