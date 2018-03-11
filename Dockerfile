FROM openjdk:8-jre-alpine

RUN apk add --no-cache ca-certificates curl tini \
 && mkdir -p /opt \
 && curl http://www.jthink.net/songkong/downloads/current/songkong-linux-headless-novm.tgz?val=77 | tar -C /opt -xzf -

EXPOSE 4567

ENTRYPOINT ["/sbin/tini"]

# VOLUME /opt/songkong/songkong.properties 

WORKDIR /opt/songkong

CMD /opt/songkong/songkongremote.sh

