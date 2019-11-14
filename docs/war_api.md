---
id: war_api
title: War API
sidebar_label: War API
---

The WAR API is built using [swagger](https://swagger.io) which simplifies the definition process of building an API. In addition it builds the controller stubs in a dozen or so languages for your conveiance. It is a powerful tool in the hands of a full stack developer

## Where do I find the Endpoints?

To see a detialed description of all API endpoints, visit [war.marist.ai:8080/api/v1/ui](http://war.marist.ai:8080/api/v1/ui). There you will find one of the many reasons Swagger Codegen is so powerful, comprehensive and interactive documentation.

## Updating the API Endpoints

To update the API endpoints the swagger definition found on [github](https://github.com/Capping-WAR/API/blob/master/swagger_server/swagger/swagger.yaml) can be placed in the [swagger editor](https://editor.swagger.io) and updated accordingly. Once any changes are made it must be re-generated, our implementation uses python-flask as the target language.

## Postgres API(Wrapper)

How does the API communicate with the database? It does so via a postgres wrapper. Originally intended to be an ORM, a Postgres Wrapper was written. The package abstracts the main functionality for communicating to the postgres database away from the API conttrolers. This makes the stubs far more readable and maintainable. For a usage guide for this individual package see the [README.md](https://github.com/Capping-WAR/API/blob/master/database/pgapi/README.md).

One of the most important pecies to the using this package is remembering to set/update its needed enviorment variables. In addition to any enviorment variables needed by the War API itself, the following are the required enviorment variables needed to use the package:

* DATABASE
* USER
* PASSWORD
* HOST
* PORT


## Deployment

When attempting to deploy the server using either method, remeber to set all needed enviorment variables mentioned above. To set the variables for deploying in docker, use a `.env` file. This file should not be commited but an example file looks like this:

```bash
DATABASE=my_db
USER=me
PASSWORD=my_pass
HOST=0.0.0.0
PORT=5432
```

### Using Docker

Deployment is made simple with the provided docker configuration files found in the repo. To deploy the API, clone the repo and via the cli run the following command:

```bash
docker-compose up -d
```

To take down the API and make any changes the image will need to be re-built. To do so first shut down the running container by running:

```bash
docker-compose down
```

Once the container is down and any changes needed for the API have been added to the source code run:

```bash
docker rmi api && docker-compose up -d
```

### Standalone (Without Docker)

After cloning the project install all needed dependencies by running:

```bash
pip3 install -r requirements.txt
```

Once completed the server is ready to be started, run:

```bash
python3 -m swagger_server
```

