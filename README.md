# Introduction

MODX on LNMP (Linux, Nginx, MySQL, PHP7) using Docker.
* Auto installation with cli
* Configured Friendly URLs on NGINX server
* Self-signed SSL Certificate

### Architecture

![architecture][1]

The whole app is divided into three Containers:

1. Nginx is running in `Nginx` Container, which handles requests and makes responses.
2. PHP or PHP-FPM is put in `PHP-FPM` Container, it retrieves php scripts from host, interprets, executes then responses to Nginx. If necessary, it will connect to `MySQL` as well.
3. MySQL lies in `MySQL` Container, 

MODX scripts are located on host, you can edit files directly without rebuilding/restarting whole images/containers.

### Contents
- MODX 2.7.0-pl
- nginx:1.15.7
- php:7.3.1-fpm
- mariadb:10.1.38-bionic
- Self-signed SSL Certificate

### PHP Extensions
- GD Lib
- PDO MySQL driver
- ImageMagick

### Configuration MODX
Edit `./php-fpm/modx_install.env` before start.

* `MODX_INSTALL_TYPE=cli` - auto cli installation
* `MODX_INSTALL_TYPE=web` - manual web installation

### Configuration MYSQL
Edit `./mariadb/credentials.env` before start.

### Build and Run

At first, you should have had [Docker](https://docs.docker.com) and [Docker Compose](https://docs.docker.com/compose) dinstalled.

Without building images one by one, you can make use of `docker-compose` and simply issue:

    $ docker-compose up

Check out your https://\<docker-host\> and have good development.

### Contributors

Pinguinens <nikolay@tegra.media>

### License

MIT

  [1]: architecture.jpg
  