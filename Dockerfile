# Imagen base oficial de Java 21
FROM eclipse-temurin:21-jdk-alpine

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia los archivos del proyecto al contenedor
COPY . .

# Da permisos de ejecución al wrapper de Maven
RUN chmod +x mvnw

# Construye el proyecto sin ejecutar tests
RUN ./mvnw clean package -DskipTests

# Expone el puerto en el que Spring Boot corre
EXPOSE 8081

# Ejecuta la aplicación Spring Boot
CMD ["java", "-jar", "target/calculator-api-0.0.1-SNAPSHOT.jar"]
