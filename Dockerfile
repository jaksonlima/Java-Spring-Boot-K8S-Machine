FROM openjdk:8-jdk-alpine as build
ARG JAR_FILE
# ARG -v $HOME/.m2:/root/.m2
COPY ${JAR_FILE} app.jar
CMD echo ${JAR_FILE}
ENTRYPOINT ["java", "-jar", "/app.jar"]

# WORKDIR /api
# COPY . .
# RUN ./mvnw clean install
# COPY /api/target/Kubernetes-0.0.1-SNAPSHOT.jar app.jar
# ENTRYPOINT ["java","-jar","/api/app.jar"]

# FROM openjdk:8-jdk-alpine as build
# WORKDIR /workspace/app

# COPY mvnw .
# COPY .mvn .mvn
# COPY pom.xml .
# COPY src src

# RUN ./mvnw install -DskipTests
# RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

# FROM openjdk:8-jdk-alpine
# VOLUME /tmp
# ARG DEPENDENCY=/workspace/app/target/dependency
# COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
# COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
# COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app
# ENTRYPOINT ["java","-cp","app:app/lib/*","hello.Application"]