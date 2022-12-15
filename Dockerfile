FROM maven:3 AS build
WORKDIR /code
COPY . /code/
RUN mvn install

FROM openjdk:17-jdk-slim-buster
EXPOSE 8081
WORKDIR /app
COPY --from=build /code/build/libs/*.jar .
CMD java -jar *.jar
