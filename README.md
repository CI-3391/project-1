# Project 1

## Run Postgres

```bash
docker-compose up --build postgres
```

## Run pgAdmin

```bash
docker-compose up --build pgadmin
```

## Connect to databse form command line

Using default user

```bash
docker exec -it project1-db-1 psql -U postgres -w postgres
```