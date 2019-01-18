#!/bin/bash
bash $ENTRYPOINT_PATH/docker-php-entrypoint
bash $ENTRYPOINT_PATH/docker-modx-prepare.sh

php-fpm