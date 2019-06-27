FROM alpine:3.9
LABEL AUTOR="MARTIN VILCHE" PROYECTO="APACHE KAFKA"
ENV KAFKA_URL=http://espejito.fder.edu.uy/apache/kafka/2.3.0/kafka_2.12-2.3.0.tgz
RUN apk add --update --no-cache gawk shadow openjdk8 bash curl && mkdir -p /opt/kafka
RUN curl $KAFKA_URL --output /tmp/kafka.tgz && tar zxvf /tmp/kafka.tgz --strip-components 1 -C /opt/kafka
COPY run.sh /usr/bin/run.sh
RUN adduser -D app && usermod -aG root app && chown -R app:0 /opt /home/app && chmod 0775 /opt /home/app 
USER app
EXPOSE 9092
ENV HOME /home/app
ENTRYPOINT ["/usr/bin/run.sh"]
CMD ["/opt/kafka/config/server.properties"]
