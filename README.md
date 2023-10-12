# Ingesta de CSV en BigQuery mediante Bash

<br>

| TABLA DE CONTENIDO     |
| ------------ |
| [Introducción](#Introducción) |
| [Paso 1](#Paso-1) |
| [Paso 2](#Paso-2) |
| [Paso 3](#Paso-3) |
| [Paso 4](#Paso-4) |
| [Paso 5](#Paso-5) |
| [Paso 6](#Paso-6) |
| [Paso 7](#Paso-7) |

<br>


### Introduccion

En este proyecto, se implementa un flujo de trabajo que simplifica la transferencia de datos desde archivos CSV
almacenados en Google Cloud Storage hacia Google BigQuery, todo ello a través de un script Bash. La automatización de
este proceso agiliza la carga y actualización de conjuntos de datos en BigQuery, lo que resulta fundamental en
aplicaciones que requieren análisis de datos en tiempo real o periódico.

El proceso consta de la creación de un bucket en Google Cloud Platform (GCP) para almacenar los archivos CSV, la
creación de un conjunto de datos en BigQuery, la elaboración de un script Bash que realiza la carga de datos, y la
ejecución de dicho script. Además, se incluye la verificación de la correcta creación de la tabla en BigQuery y la
posibilidad de realizar consultas SQL para extraer información específica.

<br>

### Paso 1
-----------

<br>

**Creación de un Bucket en GCP**


<br>

- Ingresa al panel principal de Google Cloud Platform (GCP).
- En la barra lateral, busca la opción "Cloud Storage" y despliega las opciones.
Selecciona "Buckets".
- Presiona el botón "Crear" para crear un nuevo bucket.
- Asigna un nombre al bucket.


<br>

![img_1](gcp_files/gcp1.png)

![img_3](gcp_files/gcp3.png)

![img_2](gcp_files/gcp2.png)


<br>



### Paso 2
-----------

<br>


**Carga de Archivo CSV en el Bucket**


<br>

- Carga el archivo CSV en el bucket que acabas de crear.

<br>

![img_4](gcp_files/gcp4.png)


<br>


### Paso 3
-----------


<br>

**Creación de un Conjunto de Datos en BigQuery**

<br>


- Accede a BigQuery en GCP.

<br>

![img_5](gcp_files/gcp5.png)


<br>

- Crea un conjunto de datos llamado "dd_landing". Opcionalmente, habilita el vencimiento de la tabla (en este caso, configurado a dos días).

<br>

![img_6](gcp_files/gcp6.png)


<br>

### Paso 4
-----------

<br>

**Creación de un Script Bash**

<br>

- Abre la consola de comandos en GCP y crea un archivo de script Bash llamado "bash.sh" utilizando el comando:

<br>


```cmd
nano nombre_script.sh

```

<br>

- Luego escribimos el siguiente sccript

<br>

```cmd
  bq load \
    --autodetect \
    --source_format=CSV \
    dd_landing.covid \
    gs://raw-gcp-1/covid_1.csv

```


<br>

![img_7](gcp_files/gcp7.png)

<br>

- En el script Bash, carga el archivo CSV llamado "covid_1.csv" desde Google Cloud Storage a una tabla llamada "covid" en el conjunto de datos "dd_landing" en BigQuery. BigQuery determinará automáticamente la estructura de la tabla a partir de los datos en el archivo CSV.


<br>

### Paso 5
-----------

<br>

**Ejecución del Script Bash**

<br>

- con el siguiente comnado

<br>

```cmd

bash nombre_script.sh

```

<br>







