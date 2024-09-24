# Stage 1: Build the application
FROM maven:3.9.2-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean verify

# Stage 2: Create the runtime image
FROM openjdk:17-jre-slim
COPY --from=build /app/target/my-app-*.jar app.jar
CMD ["java", "-jar", "app.jar"]
