# Nextcloud - Passman demo container

FROM nextcloud:21-apache

COPY ./docker_demo_start.sh /
RUN chmod +x /docker_demo_start.sh

ENTRYPOINT ["/docker_demo_start.sh"]
