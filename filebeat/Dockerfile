FROM beirtipol/beats:7.6.2

# Build filebeat
RUN cd $GOPATH/src/github.com/elastic/beats/filebeat && \
    GOOS=linux GOARCH=arm go get && \
    make

RUN cd $GOPATH/src/github.com/elastic/beats/filebeat && \
    mkdir -p /filebeat/bin && \
    cp filebeat /filebeat/bin/ && \
    mkdir -p /filebeat/config && \
    cp *.yml /filebeat/config/

#ENTRYPOINT ["/filebeat/bin/filebeat", "-e", "-c", "/filebeat/config/filebeat.yml"]