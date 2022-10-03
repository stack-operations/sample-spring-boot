FROM maven:3.5.2-jdk-8-alpine AS MAVEN_BUILD

MAINTAINER Sumit

COPY pom.xml /build/
COPY src /build/src/

WORKDIR /build/
RUN mvn clean install -DskipTests

FROM openjdk:8-jre-alpine
ENV env local
ENV region us-west-2
WORKDIR /app

COPY --from=MAVEN_BUILD /build/target/samplespringboot-0.0.1-SNAPSHOT.jar /app/

ENTRYPOINT ["java", "-jar", "samplespringboot-0.0.1-SNAPSHOT.jar"]