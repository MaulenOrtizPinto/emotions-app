# PROYECTO DE RECONOCIMIENTO DE EMOCIONES DE UNA VIDEO ENTREVISTA

Aplicación desarrollada por alumos de la Universidad San Sebastián, la cuál consiste en poder analizar una video entrevista para obtener las emociones detectadas en 30 fotogramas capturados en intervalos de tiempo iguales entre sí, para luego analizar y determinar clusters de personalidad (extrovertido, determinado, estructurado, creativo, racional), para luego ser mostrados al usuario mediante gráficos y checks de personalidad. Los gráficos están mediante la libreria de Javascript Highcarts (https://www.highcharts.com/) lo que permite utilizar dependencias como la descarga en distintos formatos.
Además, está configurado para poder leer parámetros para la determinación de los clusters desde una base de datos, pudiendo cambiar los valores, más no las condiciones, desde la interfaz del proyecto.

### PASOS PARA LA EJECUCIÓN DEL PROYECTO:
1. Clonar el Repositorio:
    ```bash
    git clone https://github.com/MaulenOrtizPinto/emotions-app
    ```
2. Importar a la base de datos el archivo .sql contenido dentro de la carpeta `database` a su base de datos relacional (SQL). Este contiene los valores (que pueden ser modificados) de los parámetros de las condiciones para la determinación de los clusters de personalidad.
3. Levantar el servicio Flask contenido en la carpeta `backend`. Dentro del proyecto existe otro README con los pasos necesarios para su instalación.
4. Configurar el proyecto contenido en la carpeta `frontend`. Dentro del proyecto existe otro README con los pasos necesarios para su instalación.