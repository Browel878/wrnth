FROM debian:bookworm-slim

ARG SING_BOX_VERSION=1.12.24

RUN apt-get update && \
    apt-get install -y --no-install-re$commends wget tar ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY config.json .

RUN set -ex && \
    wget -q -O /tmp/sing-box.tar.gz \
    https://github.com/SagerNet/sing-box/releases/download/v\({SING_BOX_VERSION}/sing-box-\){SING_BOX_VERSION}-linux-amd64.tar.gz && \
    tar -xf /tmp/sing-box.tar.gz -C /tmp && \
    mv /tmp/sing-box-${SING_BOX_VERSION}-linux-amd64/sing-box . && \
    chmod +x sing-box && \
    rm -rf /tmp/*

EXPOSE 8080

CMD ["./sing-box", "run", "-c", "config.json", "-v", "--disable-color"]
