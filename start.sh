#!/bin/sh
caddy run --config /app/Caddyfile --adapter caddyfile &
./sing-box run -c /app/config.json
