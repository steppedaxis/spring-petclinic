# ------------- SONARQUBE SCANNER -------------- 
FROM sonarsource/sonar-scanner-cli:latest as sonarqube
WORKDIR /app
COPY /app/sonar-project.properties ./sonar-project.properties
COPY /app /app
RUN sonar-scanner -Dsonar.projectBaseDir=/app


# ------------- ARTIFACT BUILD -------------
FROM openjdk:17-jdk as build-artifact
WORKDIR /app
COPY --from=sonarqube /app /app
RUN ./mvnw package

# --------- APP RUN --------
FROM openjdk:17-jdk as run-app
WORKDIR /code
COPY --from=build-artifact /app/target/*.jar /code/app.jar
EXPOSE 8080
CMD ["java", "-jar", "/code/app.jar"]