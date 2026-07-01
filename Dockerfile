FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y wget tar ca-certificates debian-keyring debian-archive-keyring apt-transport-https curl gnupg && \
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg && \
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' > /etc/apt/sources.list.d/caddy-stable.list && \
    apt-get update && \
    apt-get install -y caddy && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN wget -q -O /tmp/sing-box.tar.gz https://github.com/SagerNet/sing-box/releases/download/v1.12.14/sing-box-1.12.14-linux-amd64.tar.gz && \
    tar -xzf /tmp/sing-box.tar.gz -C /tmp && \
    mv /tmp/sing-box-1.12.14-linux-amd64/sing-box /app/sing-box && \
    chmod +x /app/sing-box && \
    rm -rf /tmp/*

COPY config.json /app/config.json
COPY Caddyfile /app/Caddyfile
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

EXPOSE 8080

CMD ["/app/start.sh"]
