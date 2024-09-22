cd jenkins
docker compose up -d
cd ../sonarqube
docker compose up -d
cd ../app
docker build -t my-sonar-scanner .
docker run --rm --network sonarqube_jb my-sonar-scanner