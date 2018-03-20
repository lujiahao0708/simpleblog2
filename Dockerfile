FROM maven:3.5.0-jdk-8-alpine

MAINTAINER lujiahao0708@gmail.com

RUN yum -y install maven git

RUN mkdir -p /appdata

WORKDIR /appdata

ADD . /appdata

RUN mvn package -Dmaven.test.skip=true

COPY /appdata/blog-api/target/blog-api-0.0.1.jar /usr/src/myapp/blog-api-0.0.1.jar

WORKDIR /usr/src/myapp/

ENTRYPOINT java -jar blog-api-0.0.1.jar
