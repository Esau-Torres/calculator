# Imagen base oficial de Java 17 (Puedes usar Amazon Corretto o Eclipse Temurin)
FROM eclipse-temurin:17-jdk-alpine

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copia los archivos del proyecto al contenedor
COPY . .

# Da permisos de ejecución al wrapper de Maven
RUN chmod +x mvnw

# Ejecuta el build del proyecto
RUN ./mvnw clean package -DskipTests

# Expone el puerto en el que Spring Boot corre
EXPOSE 8081

# Comando para correr la aplicación
CMD ["java", "-jar", "target/calculator-api-0.0.1-SNAPSHOT.jar"]
