# Prueba técnica

## Pruebas SQL DB2

La solución al ejercicio se encuentra en el archivo `prueba1.sql` y se ha utilizado MySQL Workbench para crear el servidor de base de datos. 

También se utiliza el complemento DB Browser de IntelliJ para conectar y ejecutar los comandos. 


## Detalles de Conexión a la Base de Datos

* Name: database
* Host: 127.0.0.1
* Port: 8083
* Login User: root
* Current User: root@localhost
* SSL cipher: TLS_AES_128_GCM_SHA256
* Información del Servidor:
* 
* Product: MySQL Community Server - GPL
* Version: 8.0.36

## application.properties para conectar a la base de datos

```properties
spring.datasource.url=jdbc:mysql://localhost:8083/database
spring.datasource.username=root
spring.datasource.password=********
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
```


## Documentación de Referencia
Documentación revisada
- [Documentación oficial de Gradle](https://docs.gradle.org)
- [Guía de referencia del complemento Spring Boot Gradle](https://docs.spring.io/spring-boot/docs/3.2.3-SNAPSHOT/gradle-plugin/reference/html/)
- [Spring Web](https://docs.spring.io/spring-boot/docs/3.2.3-SNAPSHOT/reference/htmlsingle/index.html#web)
- [Sql Queries](https://www.w3schools.com/sql)
- [Spring Boot initializer](https://start.spring.io/)

El proyecto es un proyecto hecho con Gradle y Java, a continuación vemos la configuración

### build.gradle de Gradle
```gradle
plugins {
    id 'java'
    id 'org.springframework.boot' version '3.2.3-SNAPSHOT'
    id 'io.spring.dependency-management' version '1.1.4'
}

group = 'com.example'
version = '0.0.1-SNAPSHOT'

java {
    sourceCompatibility = '17'
}

repositories {
    mavenCentral()
    maven { url 'https://repo.spring.io/milestone' }
    maven { url 'https://repo.spring.io/snapshot' }
}

dependencies {
    implementation 'org.springframework.boot:spring-boot-starter-web'
    testImplementation 'org.springframework.boot:spring-boot-starter-test'
}

tasks.named('test') {
    useJUnitPlatform()
}

```
