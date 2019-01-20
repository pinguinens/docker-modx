#!/bin/bash
echo "Preparing MODX..."
echo "Copying MODX..."
mv $SRC_ROOT/modx/* $HTML_ROOT

echo "Configuring MODX..."
cp $HTML_ROOT/_build/build.config.sample.php $HTML_ROOT/_build/build.config.php
cp $HTML_ROOT/_build/build.properties.sample.php $HTML_ROOT/_build/build.properties.php

echo "<?php" > $config
echo "/* define the MODX path constants necessary for core installation */" >> $config
echo "define('MODX_CORE_PATH', dirname(__DIR__) . '/core/');" >> $config
echo "define('MODX_CONFIG_KEY', 'config');" >> $config
echo "/* define the connection variables */" >> $config
echo "define('XPDO_DSN', 'mysql:host=$MODX_DB_SERVER;dbname=$MYSQL_DATABASE;charset=$MODX_DB_CONNECTION_CHARSET');" >> $config
echo "define('XPDO_DB_USER', '$MYSQL_USER');" >> $config
echo "define('XPDO_DB_PASS', '$MYSQL_PASSWORD');" >> $config
echo "define('XPDO_TABLE_PREFIX', '$MODX_TABLE_PREFIX');" >> $config
echo $config > $HTML_ROOT/_build/build.config.php

echo "Building MODX..."
php $HTML_ROOT/_build/transport.core.php
rm -r $HTML_ROOT/_build

if [[ $MODX_INSTALL_TYPE == "cli" ]]; then
    bash $ENTRYPOINT_PATH/docker-modx-cli-install.sh; 
fi

echo "MODX is ready"
