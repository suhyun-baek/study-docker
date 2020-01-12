FROM openjdk:8-jdk
MAINTAINER Suhyun Baek <wh567@hanmail.net>

COPY ./spring-boot-solution /spring-boot-solution
WORKDIR /spring-boot-solution

CMD ["./gradlew", "bootRun"]
