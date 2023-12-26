# PROYECTO DE RECONOCIMIENTO DE EMOCIONES DE UNA VIDEO ENTREVISTA (BACK)

Aplicación desarrollada con Flask por alumos de la Universidad San Sebastián, la cuál consiste en procesar una video entrevista para extraer 30 fotogramas equisdistantes en tiempo entre sí, para luego realizar el análisis de cada una de ellas con los servicios de aws rekognition. Los resultados son luego analizados para determinar clusters de personalidad de la persona dentro del video para devolver toda la información en un JSON.

### Requisitos PC
 - Python 3.x
 - Pip (instalador de paquetes)
 
### Instalación
1. Dentro del directorio, ejecutar ejecutar lo siguiente para instalar las dependencias necesarias:
    ```bash
    pip install -r requirements.txt
    ```
2. Dentro de tu proyecto, crea el archivo .env a partir del .env.example y reemplaza `your_access_key`, `your_secret_key`, y `your_region` con tus credenciales de aws Rekognition:
    ```env
    AWS_ACCESS_KEY_ID=your_access_key
    AWS_SECRET_ACCESS_KEY=your_secret_key
    AWS_REGION=your_region
    ```
3. Dentro del mismo archivo .env configurar las credenciales de la base de datos donde se encuentran los parámetros (seguir ejemplo de .env.example):
   ```env
    DATABASE_HOST=localhost
    DATABASE_PORT=3306
    DATABASE_NAME=my_database
    DATABASE_USERNAME=root
    DATABASE_PASSWORD=
    ```

### Ejecución
1. Ejecutar la aplicación Flask:
    ```bash
    python app.py
    ```
2. Abrir Postman o el cliente HTTP que utilices.
3. Realizar la solicitud POST a la ruta `/procesar_video`, pasando dentro del body una variable de key `video` y value el archivo de video a procesar.
