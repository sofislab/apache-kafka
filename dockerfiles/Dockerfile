FROM alpine:3.9
LABEL AUTOR="MARTIN VILCHE" PROYECTO="APACHE KAFKA"
ENV KAFKA_URL=http://espejito.fder.edu.uy/apache/kafka/2.3.0/kafka_2.12-2.3.0.tgz
RUN apk add --update --no-cache gawk openjdk8 bash curl && mkdir -p /opt/kafka
RUN curl $KAFKA_URL --output /tmp/kafka.tgz && tar zxvf /tmp/kafka.tgz --strip-components 1 -C /opt/kafka && \
chown 1001:1001 -R /opt/kafka && rm -rf /tmp/kafka.tgz
COPY run.sh /usr/bin/run.sh
USER 1001
EXPOSE 9092
ENTRYPOINT ["/usr/bin/run.sh"]
CMD ["/opt/kafka/config/server.properties"]
