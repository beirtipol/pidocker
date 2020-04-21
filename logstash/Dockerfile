FROM beirtipol/openjre:11

RUN apt-get update; \
	apt-get install -y curl zip unzip

RUN curl https://artifacts.elastic.co/downloads/logstash/logstash-7.6.2.tar.gz | tar xz && \
	ln -s /logstash-7.6.2 /logstash

# Shoutout to Alexalouit for the JRuby startup error fix
# gist.github.com/alexalouit/a857a6de10dfdaf7485f7c0cccadb98c

ENV JARDIR="/logstash/logstash-core/lib/jars"
ENV JAR="jruby-complete-9.2.9.0.jar"
ENV JRUBYDIR="${JAR}-dir"
ENV PLATDIR="META-INF/jruby.home/lib/ruby/stdlib/ffi/platform/arm-linux"

RUN cd ${JARDIR} && \
	unzip -d ${JRUBYDIR} ${JAR} && \
	cd "${JRUBYDIR}/${PLATDIR}" && \
	cp -n types.conf platform.conf && \
	cd "${JARDIR}/${JRUBYDIR}" && \
	zip -r ${JAR} * && \
	mv  -f ${JAR} .. && \
	cd ${JARDIR} && \
	rm -rf ${JRUBYDIR}

ENTRYPOINT ["/logstash/bin/logstash", "--config.reload.automatic"]