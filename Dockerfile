FROM openjdk:8-jdk-alpine
COPY . .
RUN ./mvnw clean install
COPY target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]