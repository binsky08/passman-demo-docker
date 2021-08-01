#!/bin/bash

if [ ! -f /var/www/html/config/config.php ]
then
    NEXTCLOUD_ADMIN_PASSWORD=admin NEXTCLOUD_ADMIN_USER=admin SQLITE_DATABASE=True NEXTCLOUD_TRUSTED_DOMAINS="localhost passman.cc demo.passman.cc" NEXTCLOUD_UPDATE=1 /entrypoint.sh echo "Installation done"

    su -p www-data -s /bin/sh -c "cd /var/www/html/ php occ check &&
        php occ status &&
        php occ app:list &&
        php occ app:install passman &&
        php occ app:disable firstrunwizard &&
        php occ upgrade &&
        php occ config:system:set defaultapp --value=passman"
fi

exec apache2-foreground
