FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y wget tar ca-certificates && \
    rm -rf /var/lib/apt/lists/* && \
    groupadd -g 1000 appgroup && \
    useradd -u 1000 -g appgroup -m -s /usr/sbin/nologin appuser

WORKDIR /app

RUN wget -q -O /tmp/sing-box.tar.gz https://github.com/SagerNet/sing-box/releases/download/v1.12.14/sing-box-1.12.14-linux-amd64.tar.gz && \
    tar -xzf /tmp/sing-box.tar.gz -C /tmp && \
    mv /tmp/sing-box-1.12.14-linux-amd64/sing-box /app/sing-box && \
    chmod +x /app/sing-box && \
    rm -rf /tmp/*

COPY config.json /app/config.json

USER appuser

EXPOSE 8080

CMD ["./sing-box", "run", "-c", "config.json"]
