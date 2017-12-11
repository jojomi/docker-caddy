# docker-caddy

Docker container for serving content using [caddy](https://caddyserver.com).

**Please make sure your usage of caddy is in accordance to their license.**

This docker image contains caddy webserver. This software's license can be found [here](https://github.com/mholt/caddy/blob/master/LICENSE.txt).

## Building The Image Yourself (optional)

    docker build -t jojomi/caddy:latest .


## Customizing

I decided to keep bare caddy in this image. If you need some of the caddy plugins, you need to fork this repository and follow the steps in `Updating` section.


## Updating

If you this repository is abandoned and you can't reach me to update it, this is how to make a fresh version:

* Edit the [Dockerfile](Dockerfile) changing the value of `ENV CADDY_VERSION=0.9.4`
* Tag the new version: `git tag -d 0.9 && git tag 0.9`
* Push the new tag: `git push --tags`
* If necessary, update configuration at [Docker Hub](https://hub.docker.com/r/jojomi/caddy/)


## See Also

* https://github.com/jumanjihouse/docker-caddy
