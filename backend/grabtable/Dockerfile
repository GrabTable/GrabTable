FROM amazoncorretto:17-alpine
WORKDIR /home/app
ARG JAR_FILE=build/libs/*SNAPSHOT.jar
COPY ${JAR_FILE} /home/app/app.jar
EXPOSE 8000
ENV APP_PROFILE=prod
ENTRYPOINT ["java", "-Dspring.profiles.active=${APP_PROFILE}", "-jar","/home/app/app.jar"]