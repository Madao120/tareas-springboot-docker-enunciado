FROM imaxe-con-jre:eclipse-temurin:21-jre-alpine-3.20
COPY target/ficheiro.jar /app.jar
CMD ["java", "-jar", "app.jar"]