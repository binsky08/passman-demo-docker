Passman demo docker container setup
===

Build with `docker build -t passman-demo-docker:latest .`

Start with `docker run -d -p 8080:80 -p 8443:443 --name my-passman-demo-docker passman-demo-docker:latest`

Stop / Kill with `docker kill my-passman-demo-docker`

Remove container with `docker rm my-passman-demo-docker --volumes` so that the associated volume (containing the nextcloud installation) will be removed automatically
