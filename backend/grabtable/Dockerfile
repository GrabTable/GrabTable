FROM amazoncorretto:17-alpine
WORKDIR /home/app
ARG JAR_FILE=build/libs/*SNAPSHOT.jar
COPY ${JAR_FILE} /home/app/app.jar
EXPOSE 8000
ENTRYPOINT ["java", "-Dspring.profiles.active=prod", "-jar","/home/app/app.jar"]