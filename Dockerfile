FROM eclipse-temurin:17-jdk as build
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
ADD . /usr/src/app
RUN ./mvnw clean package -DskipTests

FROM eclipse-temurin:17-jdk
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY --from=build /usr/src/app/target/*.jar /usr/src/app/app.jar
CMD ["java", "-jar", "/usr/src/app/app.jar"]