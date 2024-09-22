# ------------- SONARQUBE SCANNER --------------
FROM sonarsource/sonar-scanner-cli:latest as sonarqube
WORKDIR /app
copy ./sonar-project.properties ./sonar-project.properties
copy . /app
CMD ["sonar-scanner", "-Dsonar.projectBaseDir=/app"]

# ------------- ARTIFACT BUILD -------------
# RUN ./mvnw package