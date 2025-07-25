# Usa la imagen base de Railway (Ubuntu + Java + Maven)
FROM ghcr.io/railwayapp/nixpacks:ubuntu-1745885067

# Establece el directorio de trabajo
WORKDIR /app

# Copia el proyecto completo al contenedor
COPY . /app

# Da permisos de ejecución al wrapper de Maven
RUN chmod +x mvnw

# Ejecuta el build de Maven, cacheando dependencias
RUN --mount=type=cache,target=/root/.m2 ./mvnw clean package -DskipTests

# Comando para iniciar el jar de Spring Boot
CMD ["java", "-jar", "target/calculator-api-0.0.1-SNAPSHOT.jar"]
