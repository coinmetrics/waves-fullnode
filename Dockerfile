FROM openjdk:8-jre

ARG VERSION

ADD --chown=1000:1000 https://github.com/wavesplatform/Waves/releases/download/v${VERSION}/waves-all-${VERSION}.jar /opt/waves.jar
COPY waves.conf /opt/waves.conf

RUN useradd -m -u 1000 -s /bin/bash waves
USER waves
WORKDIR /home/waves

ENTRYPOINT ["java", "-jar", "/opt/waves.jar", "/opt/waves.conf"]
