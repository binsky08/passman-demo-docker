#!/bin/bash

if [ ! -f /var/www/html/config/config.php ]
then
    # see https://github.com/nextcloud/docker/tree/master/26/apache/config/autoconfig.php
    NEXTCLOUD_ADMIN_PASSWORD=admin NEXTCLOUD_ADMIN_USER=admin SQLITE_DATABASE=True NEXTCLOUD_TRUSTED_DOMAINS="localhost passman.cc demo.passman.cc" NEXTCLOUD_UPDATE=1 /entrypoint.sh echo "Installation complete"

    su -p www-data -s /bin/sh -c "cd /var/www/html/ php occ check &&
        php occ app:disable firstrunwizard &&
        php occ app:install passman &&
        php occ config:system:set defaultapp --value=passman &&
        php occ config:system:set appstoreenabled --type boolean --value=false"
    echo "Preconfiguration complete"
fi

exec apache2-foreground
