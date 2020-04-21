FROM beirtipol/openjre:11

RUN apt-get update; \
	apt-get install -y curl libatomic1

RUN curl https://nodejs.org/dist/v10.19.0/node-v10.19.0-linux-armv7l.tar.gz | tar xz && \
	ln -s /node-v10.19.0-linux-armv7l node

RUN curl https://artifacts.elastic.co/downloads/kibana/kibana-7.6.2-linux-x86_64.tar.gz | tar xz && \
	ln -s /kibana-7.6.2-linux-x86_64 /kibana && \
	rm -rf /kibana/node && \
	ln -s /node /kibana/node

ENTRYPOINT ["/kibana/bin/kibana", "--allow-root"]