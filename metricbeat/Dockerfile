FROM beirtipol/beats:7.6.2

# Build metricbeat
RUN cd $GOPATH/src/github.com/elastic/beats/metricbeat && \
    GOOS=linux GOARCH=arm go get && \
    make

RUN cd $GOPATH/src/github.com/elastic/beats/metricbeat && \
    mkdir -p /metricbeat/bin && \
    cp metricbeat /metricbeat/bin/ && \
    mkdir -p /metricbeat/config && \
    cp *.yml /metricbeat/config/ && \
    cp -R module /metricbeat/config/ && \
    cp -R modules.d /metricbeat/config/

ENTRYPOINT ["/metricbeat/bin/metricbeat", "-e", "-c", "/metricbeat/config/metricbeat.yml"]