FROM openjdk:11-jre-slim
WORKDIR /app
COPY target/YourGid-0.0.1-SNAPSHOT.jar yourgid.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","yourgid.jar"]