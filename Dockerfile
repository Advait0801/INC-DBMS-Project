FROM openjdk:18
EXPOSE 8080:8080
WORKDIR app/
COPY . /app/
RUN ./gradlew buildFatJar
CMD [ "java" , "-jar" , "/app/build/libs/io.shubham0204.inc-server-all.jar" ]