# ------------- SONARQUBE SCANNER -------------- 
FROM sonarsource/sonar-scanner-cli:latest as sonarqube
WORKDIR /app
copy ./sonar-project.properties ./sonar-project.properties
copy . /app
RUN sonar-scanner -Dsonar.projectBaseDir=/app || true

# ------------- ARTIFACT BUILD -------------
  # got an error when running ./mvnw package realted to Java missing dependecies, so running on a java image
FROM openjdk:17-jdk as build-artifact
WORKDIR /app
copy --from=sonarqube /app /app
RUN ./mvnw package

# --------- APP RUN --------
FROM openjdk:17-jdk as run-app
WORKDIR /app
copy --from=sonarqube /app /app
WORKDIR /code
COPY --from=build-artifact /app/target/*.jar /code/app.jar
EXPOSE 8080
CMD ["java", "-jar", "/code/app.jar"]