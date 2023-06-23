# papermc-docker

A Docker image for a 1.19 Java PaperMC server including a Maria Database server.

## Installation

This should work right out of the box, but you might want to change some things

First, clone the repo  

```sh
git clone https://github.com/fekuxle/papermc-docker.git
cd papermc-docker
```

First, you probably want to change some of the database settings
these can be found at the [Docker page for MariaDB](https://hub.docker.com/_/mariadb) under `Environment Variables` and need to be specified in a `.env` file

By default the containers store data in the `apps` directory
It saves all server data in this directory, including world files, configs and database files
To change this, edit the device path in [compose.yaml](compose.yaml)

After that, simply start the container

```sh
docker compose up
```

On the first run this prints out a RCON password
It can also be manually be read/changed in your `server.properties` file 

## Console

By default this server has RCON enabled, which should be the main way you interact with it
As mentioned above, you should have received a RCON password on the first startup
Simply use a RCON client like [mcrcon](https://github.com/Tiiffi/mcrcon)