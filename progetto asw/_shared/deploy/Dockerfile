########################################################
# Dockerfile per l'applicazione helloworld 
########################################################

FROM frolvlad/alpine-oraclejdk8 

ADD /jar/prova-0.0.1-SNAPSHOT.jar hello.jar

EXPOSE 8080

ENTRYPOINT ["/usr/bin/java", "-Xmx128m", "-Xms128m"]

CMD ["-jar", "-Dspring.profiles.active=english", "hello.jar"]
