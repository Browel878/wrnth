FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget tar ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY config.json .

RUN set -ex && \
    wget -q -O /tmp/sing-box.tar.gz https://github.com/SagerNet/sing-box/releases/download/v1.12.14/sing-box-1.12.14-linux-amd64.tar.gz && \
    tar -xzvf /tmp/sing-box.tar.gz -C /tmp && \
    mv /tmp/sing-box-1.12.14-linux-amd64/sing-box . && \
    chmod +x sing-box && \
    rm -rf /tmp/*

EXPOSE 8080

# sleep 1是魔法，可以让Back4App的日志收集器正常工作
CMD ["sh", "-c", "sleep 1 && exec ./sing-box run -c config.json -v --disable-color"]
