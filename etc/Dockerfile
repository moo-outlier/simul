FROM maven:3.6.3-jdk-11-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:11-jre-slim
COPY --from=build /home/app/target/cbm-backend-0.0.1-SNAPSHOT.jar /usr/local/lib/cbm-backend.jar

ENV SPRING_PROFILES_ACTIVE=dev
ENV LOGGING_CONFIG_ACTIVE_ENV=dev

ENTRYPOINT ["sh", "-c", "java -jar /usr/local/lib/cbm-backend.jar"]