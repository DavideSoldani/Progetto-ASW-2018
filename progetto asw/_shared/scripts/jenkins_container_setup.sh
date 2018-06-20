#! /bin/bash
JENKINS_PORT=8080
JENKINS_IMAGE_NAME=jenkins_image
JENKINS_IMAGE_PATH=/home/asw/_shared/docker/jenkins/
JENKINS_CONTAINER_NAME=jenkins_container
JENKINS_HOME=/home/asw/_shared/jenkins_configuration/jenkins_home
JENKINS_URL=http://localhost:$JENKINS_PORT

JenkinsContainerId=`docker ps -qa --filter "name=$JENKINS_CONTAINER_NAME"`
if [ -n "$JenkinsContainerId" ]
then
	echo "Stopping and removing existing jenkins container"
	docker stop $JENKINS_CONTAINER_NAME
	docker rm $JENKINS_CONTAINER_NAME
fi

# Build dell'immagine
if ! [ -a $JENKINS_IMAGE_NAME ]
then
	echo "Building the jenkins image"
	docker build -t $JENKINS_IMAGE_NAME $JENKINS_IMAGE_PATH
fi

echo "Starting jenkins container on port $JENKINS_PORT and jenkins home is $JENKINS_HOME"
# https://github.com/jenkinsci/docker
# https://hub.docker.com/r/jenkinsci/jenkins/tags/
# /var/jenkins_home contains all plugins and configuration

# Run del container
docker run -d --name $JENKINS_CONTAINER_NAME \
	-p $JENKINS_PORT:8080 -p 50000:50000 \
	-v $JENKINS_HOME:/var/jenkins_home \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v $(which docker):/bin/docker \
	-v /usr/lib/x86_64-linux-gnu/libapparmor.so.1.1.0:/lib/x86_64-linux-gnu/libapparmor.so.1 \
	-v /home/asw/_shared:/home/asw/_shared \
	-e JAVA_OPTS="-Djenkins.install.runSetupWizard=false" \
	-u root \
	--restart=always \
	$JENKINS_IMAGE_NAME


# Tempo necessario all'inizializzazione di jenkins
sleep 1m

# Setup della jenkins CLI
# DA CONTROLLARE
docker exec -i $JENKINS_CONTAINER_NAME wget $JENKINS_URL/jnlpJars/jenkins-cli.jar -P /usr/local
docker exec -i $JENKINS_CONTAINER_NAME ln -s /usr/local/jenkins-cli.jar jenkins

# installazione dei plugin necessari
# DEPRECATO: l'immagine contiene già i plugins, vedi plugins.txt
# docker exec -i $JENKINS_CONTAINER_NAME java -jar jenkins -s $JENKINS_URL install-plugin git -deploy
# docker exec -i $JENKINS_CONTAINER_NAME java -jar jenkins -s $JENKINS_URL install-plugin ssh -deploy -restart