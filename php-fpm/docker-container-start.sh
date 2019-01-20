#!/bin/bash
bash $ENTRYPOINT_PATH/docker-php-entrypoint

if [ ! -f $HTML_ROOT"/manager/index.php" ]; then
    echo "MODX was not found";
    bash $ENTRYPOINT_PATH/docker-modx-prepare.sh; 
fi

php-fpm
