# Auth Launcher

Este proyecto implementa una arquitectura de microservicios para gestionar la autenticación de usuarios y el almacenamiento de imágenes en la nube. Utiliza Docker y Docker Compose para orquestar los diferentes servicios, facilitando un entorno de desarrollo y despliegue consistente.

## ✨ Características

- **Autenticación JWT**: Microservicio de autenticación seguro basado en NestJS que utiliza JSON Web Tokens.
- **Gestión de Imágenes**: Microservicio para subir, gestionar y servir imágenes utilizando Quarkus y Cloudinary.
- **Base de Datos PostgreSQL**: Contenedor de base de datos para persistir la información de los usuarios.
- **Orquestación con Docker**: Totalmente contenedorizado y gestionado a través de `docker-compose`.

## Arquitectura

El proyecto está compuesto por los siguientes servicios:

- `auth-ms`: Un microservicio desarrollado en **NestJS** que maneja el registro y login de usuarios, generando un JWT para las sesiones.
- `cloudinary-service`: Un microservicio en **Quarkus** que se encarga de la comunicación con la API de Cloudinary para la gestión de archivos.
- `auth-db`: Una instancia de **PostgreSQL** que sirve como base de datos para el servicio de autenticación.

## 🚀 Empezando

Sigue estos pasos para levantar el entorno completo en tu máquina local.

### Prerrequisitos

Asegúrate de tener instalado lo siguiente:

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

### Instalación

1. **Clona el repositorio:**

    ```bash
    git clone --recurse-submodules <URL_DEL_REPOSITORIO>
    cd auth-launcher
    ```

2. **Configura las variables de entorno:**

    Crea un archivo `.env` en la raíz del proyecto. Puedes copiar el archivo `.env.example` si existe, o crearlo desde cero con el siguiente contenido:

    ```env
    # Auth Service Configuration
    PORT=3000
    JWT_SECRET=tu_secreto_para_jwt
    JWT_EXPIRATION=1h
    ENCRYPTION_KEY=tu_llave_de_encriptacion

    # Database Configuration
    DB_PORT_EXT=5432
    DB_USERNAME=postgres
    DB_PASSWORD=1234567
    DB_NAME=authdb

    # Cloudinary Service Configuration
    CLOUDINARY_PORT_EXT=8080
    CLOUDINARY_CLOUD_NAME=tu_cloud_name_de_cloudinary
    CLOUDINARY_API_KEY=tu_api_key_de_cloudinary
    CLOUDINARY_API_SECRET=tu_api_secret_de_cloudinary
    ```

    **Importante:** Reemplaza los valores `tu_*` con tus credenciales y secretos reales.

3. **Levanta los servicios:**

    Utiliza Docker Compose para construir las imágenes y levantar los contenedores.

    ```bash
    docker-compose up --build -d
    ```

    El flag `-d` ejecuta los contenedores en segundo plano (detached mode).

## Services URLs de los Servicios

Una vez que los contenedores estén en ejecución, los servicios estarán disponibles en las siguientes URLs:

- **Auth Service (`auth-ms`)**: `http://localhost:3000`
- **Auth Service Docs (`auth-ms`)**: `http://localhost:3000/docs`
- **Cloudinary Service (`cloudinary-service`)**: `http://localhost:8080`

## ⚙️ Gestión de los Contenedores

- **Ver logs en tiempo real:**

    ```bash
    docker-compose logs -f
    ```

    O para un servicio específico:

    ```bash
    docker-compose logs -f auth-ms
    ```

- **Detener los servicios:**

    ```bash
    docker-compose down
    ```

- **Acceder a la base de datos:**
    Puedes conectarte a la base de datos PostgreSQL usando tu cliente de base de datos preferido en `localhost:5432` con las credenciales que definiste en el archivo `.env`.
