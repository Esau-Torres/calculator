# --- Etapa 1: Build del JAR con Maven
FROM eclipse-temurin:21-jdk-alpine AS build

WORKDIR /app

# Copiamos solo pom para cache de dependencias
COPY mvnw pom.xml ./
COPY .mvn/ .mvn

RUN chmod +x mvnw
RUN ./mvnw dependency:go-offline

# Copiamos la fuente y hacemos compile
COPY src ./src
RUN ./mvnw clean package -DskipTests

# --- Etapa 2: Imagen ligera para producción
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8081

ENTRYPOINT ["java", "-jar", "app.jar"]
