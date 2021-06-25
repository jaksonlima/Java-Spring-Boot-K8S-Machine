FROM openjdk:8-jdk-alpine as build
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src
COPY target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]