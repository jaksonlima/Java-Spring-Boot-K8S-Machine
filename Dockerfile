FROM openjdk:8-jdk-alpine
COPY . .
RUN ./mvnw clean build
COPY target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]