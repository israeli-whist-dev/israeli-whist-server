FROM openjdk:8-jdk-alpine
#
COPY target/whist-demo-0.0.2-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
