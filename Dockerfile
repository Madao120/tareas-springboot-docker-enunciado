FROM maven:3.9-eclipse-temurin-21 AS builder

WORKDIR /app

# Copiamos só o pom primeiro (caché)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copiamos o código
COPY src ./src

# Compilamos sen tests
RUN mvn clean package -DskipTests -B

# ETAPA 2

FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

COPY --from=builder /app/target/*.jar /app.jar

CMD ["java", "-jar", "/app.jar"]