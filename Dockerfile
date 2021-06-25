# FROM openjdk:8-jdk-alpine as build
# WORKDIR /workspace/app

# COPY mvnw .
# COPY .mvn .mvn
# COPY pom.xml .
# COPY src src

# RUN ./mvnw install -DskipTests
# RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

FROM openjdk:8-jdk-alpine
WORKDIR /workspace/app
COPY . .
RUN --mount=type=cache,target=/root/.m2 ./mvnw clean install
COPY /workspace/app/target/*.jar /app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]