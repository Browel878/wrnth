2026-06-29T07:16:50.005Z
INFO
COPY config.json .

2026-06-29T07:16:50.006Z
INFO
Taking snapshot of files...

2026-06-29T07:16:50.007Z
INFO
RUN wget -q -O /tmp/sing-box.tar.gz https://github.com/SagerNet/sing-box/releases/download/v\({SING_BOX_VERSION}/sing-box-\){SING_BOX_VERSION}-linux-amd64.tar.gz && tar -zxf /tmp/sing-box.tar.gz -C /tmp && mv /tmp/sing-box-${SING_BOX_VERSION}-linux-amd64/sing-box /app/sing-box && chmod +x sing-box && rm -rf /tmp/*

2026-06-29T07:16:50.008Z
INFO
Cmd: /bin/sh

2026-06-29T07:16:50.009Z
INFO
Args: [-c wget -q -O /tmp/sing-box.tar.gz https://github.com/SagerNet/sing-box/releases/download/v\({SING_BOX_VERSION}/sing-box-\){SING_BOX_VERSION}-linux-amd64.tar.gz && tar -zxf /tmp/sing-box.tar.gz -C /tmp && mv /tmp/sing-box-${SING_BOX_VERSION}-linux-amd64/sing-box /app/sing-box && chmod +x sing-box && rm -rf /tmp/*]

2026-06-29T07:16:50.010Z
INFO
Running: [/bin/sh -c wget -q -O /tmp/sing-box.tar.gz https://github.com/SagerNet/sing-box/releases/download/v\({SING_BOX_VERSION}/sing-box-\){SING_BOX_VERSION}-linux-amd64.tar.gz && tar -zxf /tmp/sing-box.tar.gz -C /tmp && mv /tmp/sing-box-${SING_BOX_VERSION}-linux-amd64/sing-box /app/sing-box && chmod +x sing-box && rm -rf /tmp/*]

2026-06-29T07:16:50.301Z
INFO
error building image: error building stage: failed to execute command: waiting for process to exit: exit status 8

2026-06-29T07:16:50.637Z
SYSTEM
image build failed

2026-06-29T07:16:50.638Z
SYSTEM
deployment failed
