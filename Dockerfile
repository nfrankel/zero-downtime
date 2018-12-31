# docker build -t h2 .
# docker run --rm -p8181:81 -p1521:1521/tcp --name h2 h2:latest

FROM openjdk:16-jdk-alpine

ENV VERSION 1.4.200

RUN apk add --no-cache curl \
 && curl https://repo.maven.apache.org/maven2/com/h2database/h2/$VERSION/h2-$VERSION.jar -o h2.jar

EXPOSE 81 1521

ENTRYPOINT ["sh", "-c", "java -cp h2.jar org.h2.tools.Server -baseDir /root -web -webAllowOthers -webPort 81 -tcp -tcpAllowOthers -tcpPort 1521 -ifNotExists"]