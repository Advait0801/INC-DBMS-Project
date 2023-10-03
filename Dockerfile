FROM openjdk:18
EXPOSE 8080:8080
WORKDIR app/
COPY ./build/libs/*-all.jar /app/backend.jar
ENTRYPOINT [ "java" , "-jar" , "/app/backend.jar" ]