# papermc-docker

A Docker image for a 1.19 Java PaperMC server.

## Installation

This should work right out of the box, but you might want to change some things

First, clone the repo  

```sh
git clone https://github.com/fekuxle/papermc-docker.git
cd papermc-docker
```

By default the image needs a folder at your users home directory called `minecraft`,
It saves all server data in this directory, including world files and configs
To change this, edit the device path in [compose.yaml](compose.yaml)

Create the directory, replace the name or path if you changed the location

```sh
mkdir ~/minecraft
```

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