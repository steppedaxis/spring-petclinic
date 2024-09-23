DEVOPS FINAL PROJECT:

Instructions:
1) run the intall_and_run_jenkins_sonarqube.sh to install both jenkins and sonarqube using docker-compose (docker-compose files are at /jenkins and /sonarqube). i used the jb images and dockerfiles we used in the jenkins and sonarqube lessons.
2) jenkins has a volume mount that saves the build-and-upload-to-dockerhub pipeline job, when the containers for jenkins are deleted (made it as a challenge of my own, though not needed in the project, wanted to try it myself).
3) jenkins will be avilable on localhost:8081 and sonarqube on localhost:9000
4) at jenkins, run the build-and-upload-to-dockerhub pipeline job (jenkinsfile at /app folder)




issues i ran into:
1) pom.xml file nohttp plugin - had to change the following in the pom.xml file:
              <sourceDirectories>${basedir}/app</sourceDirectories>
              <includes>app/**/*</includes>
              <excludes>**/.git/**/*,**/.idea/**/*,**/target/**/,**/.flattened-pom.xml,**/sonar-project.properties,**/sonar-project.properties,**/jenkins/**/*,**/*.class</excludes>
    
    because my folder structes were different.

2) sonarqube properties file sonar.host.url=http://host.docker.internal:9000 - i had to change it to the docker local internal dns so during the build so the sonarqube stage will run, if i tried http://sonarqube:9000, it would fail at dns level and would not reach the sonarqube server, mainly because that i run it locally.


