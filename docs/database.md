---
id: database
title: Database
sidebar_label: Database
---

The war tool uses a Postgres database to store and process all relevant user and sentence information.

## SQL Defintion

All the necessary SQL commands to create a new instance of the War database can be found within the `database` directory of the [API repository](https://github.com/Capping-WAR/API/tree/master/database). Use this file during deployment to recreate the necessary tables and procedures.


## Deployment

The Postgres database is deployed using docker, to deploy a new instance of the war database perform the following steps.

On the target server create a new file called `docker-compose.yaml`. Place the following definition as the content of the file.

```yaml
version: '2'
services:
    database:
        image: postgres:11
        ports:
            - "5432:5432"
        volumes:
            - ${PWD}/database:/var/lib/postgresql/data/
            - ./war.sql:/docker-entrypoint-initdb.d/war.sql
        hostname: "db"
        env_file: .env
        environment:
            POSTGRES_PASSWORD: $PASSWORD
            POSTGRES_USER: $USER
            POSTGRES_DB: $NAME
```

Next, add the [SQL Definition](https://github.com/Capping-WAR/API/tree/master/database/war.sql) to the same directory. Then, three environment variables must be set in the docker container upon startup. To accomplish this create a file called `.env` and set the contents similar to below(change the values where appropriate):

```bash
NAME=DB_NAME
USER=DB_USER
PASSWORD=DB_PASS
```

Finally, deploy the database by running:

```bash
docker-compose up -d
```

