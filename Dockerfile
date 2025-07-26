# Usa JDK 21 (acorde a tu pom.xml)
FROM eclipse-temurin:21-jdk-alpine

# Establece el directorio de trabajo
WORKDIR /app

# Copia todos los archivos al contenedor (incluyendo mvnw, pom.xml, src, etc)
COPY . .

# Da permisos de ejecución al wrapper de Maven
RUN chmod +x mvnw

# Ejecuta el build del proyecto (sin ejecutar tests)
RUN ./mvnw clean package -DskipTests

# Expone el puerto donde correrá Spring Boot
EXPOSE 8081

# Ejecuta la aplicación
CMD ["java", "-jar", "target/api-0.0.1-SNAPSHOT.jar"]
