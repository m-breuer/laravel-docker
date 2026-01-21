# Laravel Docker Environment

This repository provides a comprehensive Docker-based environment for Laravel applications, with a clear separation between development and production setups.

## Features

-   **Development & Production Ready:** Separate configurations for development and production.
-   **Traefik Integration:** Automatic SSL and custom domains with Traefik.
-   **Pre-configured Services:** Includes MariaDB, Redis, and Mailpit for development.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

-   [Docker](https://docs.docker.com/get-docker/)
-   [Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

1.  **Clone the Repository:**

    ```bash
    git clone https://github.com/m-breuer/laravel-docker.git
    cd laravel-docker
    ```

2.  **Environment Configuration:**

    Copy the `.env.example` file to `.env` and customize the variables.

    ```bash
    cp .env.example .env
    ```

    Make sure to set the following variables in your `.env` file:
    - `APP_DOMAIN`: Your application's domain (e.g., `laravel.localhost`).
    - `LETSENCRYPT_EMAIL`: Your email for Let's Encrypt.
    - `DB_PASSWORD`: Your database password.

## Development

To start the development environment, run:

```bash
docker-compose -f docker-compose.yml -f docker-compose.dev.yml -f docker-compose.traefik.yml up -d
```

This will start the following services:
- `laravel.docker`: The application container with PHP 8.3, Nginx, and all development tools. Your local code is mounted into this container.
- `mariadb`: MariaDB database server.
- `redis`: Redis in-memory data store.
- `mailpit`: An email testing tool with a web UI, accessible at `http://localhost:8025`.
- `traefik`: The Traefik reverse proxy.

Your application will be available at `https://<your-app-domain>`.

To stop the development environment, run:
```bash
docker-compose -f docker-compose.yml -f docker-compose.dev.yml -f docker-compose.traefik.yml down
```

### Switching PHP Versions

To switch the PHP version for the development environment, set the `PHP_VERSION` variable in your `.env` file to one of the available versions: `8.3`, `8.4`, or `8.5`. If not set, it will default to `8.3`.

## Production

To build and start the production environment, run:

```bash
docker-compose -f docker-compose.yml -f docker-compose.prod.yml -f docker-compose.traefik.yml up -d --build
```

This will build optimized production images for PHP-FPM and Nginx and start the following services:
- `php`: The PHP-FPM container.
- `nginx`: The Nginx container, which serves your application.
- `mariadb`: MariaDB database server.
- `redis`: Redis in-memory data store.
- `traefik`: The Traefik reverse proxy.

Your application will be available at `https://<your-app-domain>`.

To stop the production environment, run:
```bash
docker-compose -f docker-compose.yml -f docker-compose.prod.yml -f docker-compose.traefik.yml down
```

## Services

| Service         | Description                            | Development | Production |
| :-------------- | :------------------------------------- | :---------- | :--------- |
| `laravel.docker`| The Laravel application container.     | ✓           | ✗          |
| `php`           | The PHP-FPM container.                 | ✗           | ✓          |
| `nginx`         | The Nginx container.                   | ✗           | ✓          |
| `mariadb`       | MariaDB database server.               | ✓           | ✓          |
| `redis`         | Redis in-memory data store.            | ✓           | ✓          |
| `mailpit`       | An email testing tool.                 | ✓           | ✗          |
| `traefik`       | The Traefik reverse proxy.             | ✓           | ✓          |


## Contributing

Contributions are welcome! If you have any suggestions or find any issues, please feel free to open an issue or submit a pull request.
