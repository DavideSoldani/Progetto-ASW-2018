#! /bin/bash
JAVA_PORT=9090
JAVA_CONTAINER_NAME=java_container


JavaContainerId=`docker ps -qa --filter "name=$JAVA_CONTAINER_NAME"`
if [ -n "$JavaContainerId" ]
then
	echo "Stopping and removing existing java container"
	docker stop $JAVA_CONTAINER_NAME
	docker rm $JAVA_CONTAINER_NAME
fi

echo "Creating and Starting java container"

cd /home/asw/_shared/docker/deploy/
docker build -f Dockerfile -t java_container_image .
docker create --name=$JAVA_CONTAINER_NAME java_container_image
docker start -i $JAVA_CONTAINER_NAME

