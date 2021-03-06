#!/bin/bash

VOLUME_HOME="/var/lib/mysql"

if [[ ! -d $VOLUME_HOME/mysql ]]; then
    echo "=> An empty or uninitialized MariaDB volume is detected in $VOLUME_HOME"
    echo "=> Installing MySQL ..."
    mysql_install_db --user=mysql> /dev/null 2>&1
    echo "=> Done!"
    ./setup.sh
else
    echo "=> Using an existing volume of MySQL"
fi

exec mysqld_safe
