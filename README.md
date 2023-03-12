# Project 1

## INFO

* Diagrama: `resources/model.png`
* Script principal: `run.sh`
* Scripts de creado del schema y tablas de la base de datos: `db/init/*`
* Queries respuestas a las preguntas: `db/queries/*`

Luego de ejecutar run.sh, los resultados de cada query quedan insertados en 
tablas con el mismo nombre. Por ejemplo, el query_one.sql es cargado en la tabla
query_one. Por lo tanto, basta con ejecutar

select * from query_{number_name}

donde number_name = {one, two, three, four, five}

* Repositorio en Github: [https://github.com/CI-3391/project-1](https://github.com/CI-3391/project-1)
* Modelo en Vertabelo: [https://my.vertabelo.com/public-model-view/6yNbdi3BjLQ9k0DbCDySfUUeAqZgJw4hbpHfLEFS5IctEba6I91zfon9sgvUcORw?x=1812&y=1846&zoom=0.2838](https://my.vertabelo.com/public-model-view/6yNbdi3BjLQ9k0DbCDySfUUeAqZgJw4hbpHfLEFS5IctEba6I91zfon9sgvUcORw?x=1812&y=1846&zoom=0.2838)

## DEVELOPMENT

### Run Postgres

```bash
docker-compose up --build postgres
```

### Run pgAdmin

```bash
docker-compose up --build pgadmin
```

### Connect to database from command line

Using default user

```bash
docker exec -it project1-postgres-1 psql -U postgres -w postgres
```

### Connect to database from pgadmin

* Name: project-1
* Host: project1-postgres-1
* Post: 5432
* Maintenance Database: postgres
* Username: postgres
* Password: postgres