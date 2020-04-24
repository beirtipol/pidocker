FROM beirtipol/beats:7.6.2

# Build heartbeat
RUN cd $GOPATH/src/github.com/elastic/beats/heartbeat && \
    GOOS=linux GOARCH=arm go get && \
    make

RUN cd $GOPATH/src/github.com/elastic/beats/heartbeat && \
    mkdir -p /heartbeat/bin && \
    cp heartbeat /heartbeat/bin/ && \
    mkdir -p /heartbeat/config && \
    cp *.yml /heartbeat/config/

ENTRYPOINT ["/heartbeat/bin/heartbeat", "-e", "-c", "/heartbeat/config/heartbeat.yml"]