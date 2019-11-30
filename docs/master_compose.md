---
id: master_compose
title: Master Compose File
sidebar_label: One file to rule them all
---

## Setup 
To use the master compose file all the GitHub repositories need to be pulled into the same directory. Use the following commands as a guide:

`frontend`
```
git clone https://github.com/Capping-WAR/frontend.git
```

`API`
```
git clone https://github.com/Capping-WAR/API.git
```

`Reverse Proxy`
```
git clone https://github.com/Capping-WAR/ReverseProxy.git
```

`Docs`
``` 
git clone https://github.com/Capping-WAR/documentation.git
```

Once all four repositories are cloned into a single directory, place the [war.sql](https://github.com/Capping-WAR/API/blob/master/database/war.sql) file (or just the already created database dir) in the directory. Next, add environment files for both the database (place in the directory with the war.sql file) and the API (place in the API repo). For details on what variables should be set for the [API](/docs/war_api) and [Database](/docs/database).

Finally, place the file below in the directory holding all of the repositories and files, and name it `docker-compose.yaml`. To build, and deploy all services, simply run:

```
docker-compose up -d
```

And to see the logs for all of the services run:

```
docker-compose logs
```

**note: for any issues with individual services starting up, see there respective documentation**

```
# Author: Daniel Gisolfi
# Purpose: To orchestrate the deployment of all services for the War Tool
# 2019-11-29

version: '2'
services:
    database:
        image: postgres:11
        ports:
        - "5432:5432"
        hostname: "db"
        env_file: .env
        environment:
        POSTGRES_PASSWORD: $PASSWORD
        POSTGRES_USER: $USER
        POSTGRES_DB: $NAME
        volumes:
        - ${PWD}/database:/var/lib/postgresql/data/
        # - ./war.sql:/docker-entrypoint-initdb.d/war.sql -- Uncomment for clean slate run
    api:
        build: ./API/.
        restart: unless-stopped
        container_name: war-api
        env_file: ./API/.env
        ports:
        - "8080:8080"
    nginx:
        build: ./ReverseProxy/.
        restart: unless-stopped
        ports:
        - "80:80"
        - "443:443" 
    frontend:
        build: ./frontend/.
        restart: unless-stopped
        container_name: war-frontend
        ports:
        - "8081:3000"
    docusaurus:
        build: ./documentation/.
        ports:
        - 8082:3000
```