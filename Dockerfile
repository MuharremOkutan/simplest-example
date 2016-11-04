FROM openjdk:8-jdk-alpine 
MAINTAINER Halil-Cem Guersoy <halil-cem.guersoy@gmail.com>
COPY target/simplest-example-0.1.0.jar /simplest-example.jar 
EXPOSE 8080
CMD java -jar /simplest-example.jar