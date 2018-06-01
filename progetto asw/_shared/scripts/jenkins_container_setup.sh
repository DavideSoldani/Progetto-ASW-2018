#! /bin/bash
JENKINS_PORT=8080
JENKINS_CONTAINER_NAME=jenkins_container
JENKINS_HOME=~/jenkins_home

mkdir $JENKINS_HOME

JenkinsContainerId=`docker ps -qa --filter "name=$JENKINS_CONTAINER_NAME"`
if [ -n "$JenkinsContainerId" ]
then
	echo "Stopping and removing existing jenkins container"
	docker stop $JENKINS_CONTAINER_NAME
	docker rm $JENKINS_CONTAINER_NAME
fi

echo "Starting jenkins container on port $JENKINS_PORT and jenkins home is $JENKINS_HOME"
# https://github.com/jenkinsci/docker
# https://hub.docker.com/r/jenkinsci/jenkins/tags/
# /var/jenkins_home contains all plugins and configuration
docker run -d --name $JENKINS_CONTAINER_NAME \
	-p $JENKINS_PORT:8080 -p 50000:50000 \
	-v $JENKINS_HOME:/var/jenkins_home \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v $(which docker):/bin/docker \
	-v /usr/lib/x86_64-linux-gnu/libapparmor.so.1.1.0:/lib/x86_64-linux-gnu/libapparmor.so.1 \
	-v /home/asw/_shared:/home/asw/_shared \
	-u root \
	jenkins:1.609.3

#tempo necessario all'inizializzazione di jenkins
sleep 1m

#provisioning jenkins
docker exec -i jenkins_container wget http://localhost:8080/jnlpJars/jenkins-cli.jar -P /usr/local
docker exec -i jenkins_container ln -s /usr/local/jenkins-cli.jar jenkins
docker exec -i jenkins_container java -jar jenkins -s http://localhost:8080/ help


