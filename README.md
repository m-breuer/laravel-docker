# Laravel Docker Environment

This repository provides a comprehensive Docker-based development environment for Laravel applications. It is designed to be used as a central-managed environment for multiple projects.

## Features

-   **Multiple PHP Runtimes:** Easily switch between PHP 8.1, 8.2, 8.3, and 8.4.
-   **Pre-configured Services:** Includes essential services like MariaDB, Redis, and Mailpit out of the box.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

-   [Docker](https://docs.docker.com/get-docker/)
-   [Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

1.  **Clone the Repository:**

    It is recommended to clone this repository to a central location on your system, for example, `~/laravel-docker`.

    ```bash
    git clone https://github.com/m-breuer/laravel-docker.git ~/laravel-docker
    ```

2.  **Project Setup:**

    For each of your Laravel projects, you will need to do the following:

    a. **Copy the `.env.example` to `.env`:**

    In your Laravel project's root directory, copy the `.env.example` from this repository to `.env`.

    b. **Configure your `.env` file:**

    Open the `.env` file and customize the variables. It is important to set a unique `APP_PORT` and `FORWARD_DB_PORT` for each project to avoid port conflicts.

    c. **Add a `docker-compose.yml` file:**

    In your Laravel project's root directory, create a `docker-compose.yml` file with the following content:

    ```yaml
    version: '3'

    services:
      main:
        extends:
          file: ~/laravel-docker/docker-compose.yml
          service: laravel.docker
    ```

    This will extend the main `docker-compose.yml` file and use the `laravel.docker` service.

3.  **Start the Containers:**

    To start the containers for a specific project, navigate to the project's root directory and run:

    ```bash
    docker-compose up -d
    ```

    To stop the containers, use:

    ```bash
    docker-compose down
    ```

## Switching PHP Versions

To switch the PHP version for a specific project, you can override the `build.context` in your project's `docker-compose.yml` file.

For example, to use PHP 8.2, your `docker-compose.yml` would look like this:

```yaml
version: '3'

services:
    main:
        extends:
            file: ~/laravel-docker/docker-compose.yml
            service: laravel.docker
        build:
            context: ~/laravel-docker/runtimes/8.2
```

The available runtimes are located in the `runtimes` directory of this repository.

## Services

This environment includes the following services:

| Service         | Description                            | Default Port (Host) |
| :-------------- | :------------------------------------- | :------------------ |
| `laravel.docker`| The Laravel application container.     | `80`                |
| `mariadb`       | MariaDB database server.               | `3306`              |
| `redis`         | Redis in-memory data store.            | `6379`              |
| `mailpit`       | An email testing tool with a web UI.   | `1025` (SMTP), `8025` (Web) |

You can access the Mailpit web interface at `http://localhost:8025`.

## Contributing

Contributions are welcome! If you have any suggestions or find any issues, please feel free to open an issue or submit a pull request.