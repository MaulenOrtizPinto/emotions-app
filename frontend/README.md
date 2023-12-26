# PROYECTO DE RECONOCIMIENTO DE EMOCIONES DE UNA VIDEO ENTREVISTA (FRONT)

Aplicación desarrollada con Laravel por alumos de la Universidad San Sebastián, la cuál consiste en cargar un video para enviarlo al servicio de flask dentro del mismo repositorio en la carpeta backend, para luego mostrar los resultados del análisis del video en forma gráfica.

### Requisitos PC
 - Entorno de desarrollo (XAMPP, Laragon, etc)
 - PHP
 - Composer

### Instalación
1. Mover el directorio a la carpeta de proyectos del entorno de desarrollo. Por ejemplo, en Laragon, el directorio generalmente es: `C:\laragon\www\nombre-del-proyecto`
2. instalar componentes del proyecto:
    ```bash
    composer install
    ```
3. Dentro de tu proyecto, crea el archivo .env a partir del .env.example y reemplaza las variables de entorno:
    ```env
    DB_CONNECTION=mysql
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=my-database
    DB_USERNAME=root
    DB_PASSWORD=

    PROCESS_VIDEO_URL=http://localhost:port/procesar_video
    ```

### Ejecución
Este punto dependerá de tu entorno de desarrollo instalado. Laragon provee virtual host automaticos, pudiendo acceder al proyecto desde un navegador a través de la ruta `mi-proyecto.test`.

### Consideración:
Es necesario levantar el servicio en Flask para poder analizar el video, de lo contrario, no habrá respuesta de análisis (verificar posibles errores en consola)