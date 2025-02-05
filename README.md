# Netzgrafik-Editor Backend API

This repository contains the source for the backend API for the [Netzgrafik-Editor frontend](https://github.com/SchweizerischeBundesbahnen/netzgrafik-editor-frontend).

- [Spring Framework](https://spring.io/projects/spring-framework)
  with [Spring Boot](https://spring.io/projects/spring-boot) is used to implement the REST API.
- Data is stores in the [PostgreSQL](https://www.postgresql.org) relational database.
- [jOOQ](https://www.jooq.org/) is used to access the database through a database-independent
  SQL-Like Domain-Specific-Language. For that the jOOQ framework generates classes for every table,
  row, index and sequence in the database. This allows for type-save declarations of SQL queries.
- [Flyway](https://flywaydb.org/) migrations are used to manage the database schema (see
  src/main/resources/db.migration).
- [Project Lombok](https://projectlombok.org/) enhances the Java code with additional language
  features.
- [H2](https://www.h2database.com/html/main.html) is used as an in-memory database for end-to-end
  integration tests.


## Getting-Started

### Setup Development Environment

#### Prerequisites

- Java JDK
- Maven
- Docker and `docker-compose`


### Command line setup guide

1. Clone the repository:
   ```shell
   git clone https://github.com/SchweizerischeBundesbahnen/netzgrafik-editor-backend.git
   cd netzgrafik-editor-backend
   ```

1. Start the local development environment (PostgreSQL, Keycloak):
   ```shell
   docker compose up -d
   ```

1. Setup environment variables
   ```shell
   export DB_URL=jdbc:postgresql://localhost/netzgrafikeditor
   export DB_USER=netzgrafikeditor
   export DB_PASSWORD=netzgrafikeditor
   export CORS_ALLOWED_ORIGINS=*
   export AUTH_SERVICE_NAME=fc44839c-e95f-4854-a52d-449867a9aa62
   ```

1. Run database migrations
   ```shell
   # run migrations
   mvn flyway:migrate
   ```
   - The database schema is managed using [Flyway](https://flywaydb.org/). Migrations are placed
under `src/main/resources/db/migration` and can be executed using maven.

1. Start the app using maven
   ```shell
   mvn spring-boot:run
   ```

## License

This project is licensed under [Apache 2.0](LICENSE).

## Contributing

This repository includes a [CONTRIBUTING.md](CONTRIBUTING.md) file that outlines how to contribute to the project, including how to submit bug reports, feature requests, and pull requests.

## Coding Standards

This repository includes a [CODING_STANDARDS.md](CODING_STANDARDS.md) file that outlines the coding standards that you should follow when contributing to the project.

## Code of Conduct

To ensure that your project is a welcoming and inclusive environment for all contributors, you should establish a good [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)
