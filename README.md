# Documentación del Proyecto Servlet-Form

Este proyecto es una aplicación web desarrollada en Java, que utiliza Servlets para gestionar formularios. El proyecto está diseñado para ser desplegado en un servidor Tomcat y utiliza Maven como sistema de gestión y construcción.


## Requisitos
- JDK 17
- Apache Maven
- Apache Tomcat


## Configuración del Proyecto
El archivo `pom.xml` contiene la configuración de Maven, incluyendo las dependencias necesarias y la configuración para el plugin de Tomcat, permitiendo el despliegue de la aplicación directamente desde Maven.

```xml
<dependency>
    <groupId>jakarta.platform</groupId>
    <artifactId>jakarta.jakartaee-api</artifactId>
    <version>9.1.0</version>
    <scope>provided</scope>
</dependency>
```

## Estructura del Proyecto
El proyecto sigue la estructura estándar de Maven para proyectos web:

 - src/main/java: Contiene los Servlets y otras clases Java.
 - src/main/webapp: Contiene los archivos JSP, HTML y otros recursos web como CSS o JavaScript.

   
## Servlets Implementados
FormServlet: este Servlet maneja las peticiones POST del formulario, procesando los datos ingresados y mostrando una respuesta al usuario.

```java
@WebServlet("/registro")
public class FormServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Implementación
    }
}
```

Claro, aquí está el texto en formato Markdown:

markdown
Copy code
# Documentación del Proyecto Servlet-Form

Este proyecto es una aplicación web desarrollada en Java, que utiliza Servlets para gestionar formularios. El proyecto está diseñado para ser desplegado en un servidor Tomcat y utiliza Maven como sistema de gestión y construcción.

## Requisitos
- JDK 17
- Apache Maven
- Apache Tomcat

## Configuración del Proyecto
El archivo `pom.xml` contiene la configuración de Maven, incluyendo las dependencias necesarias y la configuración para el plugin de Tomcat, permitiendo el despliegue de la aplicación directamente desde Maven.

```xml
<dependency>
    <groupId>jakarta.platform</groupId>
    <artifactId>jakarta.jakartaee-api</artifactId>
    <version>9.1.0</version>
    <scope>provided</scope>
</dependency>
Estructura del Proyecto
El proyecto sigue la estructura estándar de Maven para proyectos web:

src/main/java: Contiene los Servlets y otras clases Java.
src/main/webapp: Contiene los archivos JSP, HTML y otros recursos web como CSS o JavaScript.
Servlets Implementados
FormServlet
Este Servlet maneja las peticiones POST del formulario, procesando los datos ingresados y mostrando una respuesta al usuario.

java
Copy code
@WebServlet("/registro")
public class FormServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Implementación
    }
}
```


## Despliegue
Para desplegar la aplicación, se puede utilizar el plugin de Tomcat de Maven configurado en el `pom.xml`. Asegúrate de tener un servidor Tomcat corriendo y configurado correctamente.
```bash
mvn tomcat7:deploy
```


## Acceso a la Aplicación
Una vez desplegada, la aplicación estará accesible desde un navegador web en la URL configurada para el servidor Tomcat, usualmente `http://localhost:8080/webapp-form.`
