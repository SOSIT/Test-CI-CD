FROM openjdk:11.0.6-jdk-stretch
VOLUME /tmp
COPY build/libs/*.jar app.jar
ENTRYPOINT exec java -jar /app.jar 