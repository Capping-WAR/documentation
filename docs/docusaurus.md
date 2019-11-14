---
id: docusaurus
title: Docusaurus
sidebar_label: Docusaurus
---

Inception? ...Yes.

## Running in Development

Docusaurus has a wonderful feature that allows for live editing. To run the server in development in order to make changes run the following command after cloning the [github repository](https://github.com/Capping-WAR/documentation).

```bash
# Run `cd website` first if you are in the root of the repo
yarn start
```

## Deploying for Production

### Standalone (Without Docker)

To run in production without docker the process is very similar to running in development. Run the following command from the website directory in the repo.

```bash
yarn start --no-watch
```

This will turn off the LiveReload server. 

### Docker 

To deploy using docker simply run the following command in the root of the repo

```bash
docker-compose up -d
```