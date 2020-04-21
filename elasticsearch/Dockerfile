FROM beirtipol/openjre:11

RUN apt-get update; \
	apt-get install -y curl

RUN curl https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.6.2-linux-x86_64.tar.gz \
	| tar xz && rm -rf /elasticsearch-7.6.2/jdk && ln -s /elasticsearch-7.6.2 /elasticsearch

ENTRYPOINT ["/elasticsearch/bin/elasticsearch"]