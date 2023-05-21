Passman demo docker container setup
===

This image can be used as a demo instance of Passman in Nextcloud.

My development container is available [here](https://github.com/binsky08/passman-dev-docker-build).

## Usage
Build with `docker build -t passman-demo-docker:latest .`

Default start with `docker run -d -p 8080:80 --name my-passman-demo-docker passman-demo-docker:latest`

Custom SSL start with:
```
docker run -d -p 8080:80 -p 8443:443 \
    -v /opt/passman-demo-docker/certificate.pem:/etc/ssl/private/cert.pem \
    -v /opt/passman-demo-docker/key.pem:/etc/ssl/private/privkey.pem \
    -v /opt/passman-demo-docker/certificate.pem:/etc/ssl/private/fullchain.pem \
    --name my-passman-demo-docker \
    passman-demo-docker:latest
```

Stop / Kill with `docker kill my-passman-demo-docker`

Remove container with `docker rm my-passman-demo-docker --volumes` so that the associated volume (containing the nextcloud installation) will be removed automatically

