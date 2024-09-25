DEVOPS FINAL PROJECT:

Instructions:
1) run the intall_and_run_jenkins_sonarqube.sh to install both jenkins and sonarqube using docker-compose (docker-compose files are at /jenkins and /sonarqube). i used the jb images and dockerfiles we used in the jenkins and sonarqube lessons.
2) login to sonarqube at localhost:9000, user and pass are admin, pls change the password to admin1 (this is the pass i configured in sonarqube properties file..)
2) jenkins has a volume mount that saves all configuration i made, including the job and the credentials, so you just need to run the job in order to start the sonarqube scan, docker build and publish
3) jenkins will be avilable on localhost:8081
4) at jenkins, run the pipeline job (jenkinsfile at /app folder)
5) the rest is related to k8s and helm, i used k3d to start my own cluster, checked kubectl logs, all worked for me with the app and mysql




