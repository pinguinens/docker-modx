#!/bin/bash
echo "Copying MODX... \n"
mv /var/www/src/modx/* $HTML_ROOT

echo "Configuring MODX... \n"
cp $HTML_ROOT/_build/build.config.sample.php $HTML_ROOT/_build/build.config.php
cp $HTML_ROOT/_build/build.properties.sample.php $HTML_ROOT/_build/build.properties.php

echo "<?php" > $config
echo "/* define the MODX path constants necessary for core installation */" >> $config
echo "define('MODX_CORE_PATH', dirname(__DIR__) . '/core/');" >> $config
echo "define('MODX_CONFIG_KEY', 'config');" >> $config
echo "/* define the connection variables */" >> $config
echo "define('XPDO_DSN', 'mysql:host=mysql;dbname=modx_website;charset=utf8');" >> $config
echo "define('XPDO_DB_USER', 'modx_user');" >> $config
echo "define('XPDO_DB_PASS', ''modx_pass);" >> $config
echo "define('XPDO_TABLE_PREFIX', 'modx_');" >> $config
echo $config > $HTML_ROOT/_build/build.config.php

echo "Building MODX... \n"
php $HTML_ROOT/_build/transport.core.php

rm $HTML_ROOT/.gitkeep