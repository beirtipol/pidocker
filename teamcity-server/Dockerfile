FROM beirtipol/openjdk:11

RUN apt-get update; \
	apt-get install -y curl

ENV TEAMCITY_DATA_PATH=/data/teamcity_server/datadir \
    TEAMCITY_DIST=/opt/teamcity \
    TEAMCITY_LOGS=/opt/teamcity/logs \
    TEAMCITY_SERVER_MEM_OPTS="-Xmx2g -XX:ReservedCodeCacheSize=350m" \
    LANG=C.UTF-8

WORKDIR /opt

RUN curl -L https://download.jetbrains.com/teamcity/TeamCity-2019.2.4.tar.gz | tar xz && \
    mv TeamCity teamcity && \
    rm -rf teamcity/buildAgent

EXPOSE 8111

COPY welcome.sh /welcome.sh
COPY run-server.sh /run-server.sh
COPY run-services.sh /run-services.sh

VOLUME $TEAMCITY_DATA_PATH \
       $TEAMCITY_LOGS

CMD ["/run-services.sh"]