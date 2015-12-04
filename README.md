# docker-caddy

Docker container for serving content using [caddy](https://caddyserver.com).

This docker image contains caddy webserver, version 0.8. This software's license can be found [here](https://github.com/mholt/caddy/blob/master/LICENSE.txt).


## Customizing

I decided to keep bare caddy in this image. If you need some of the caddy plugins, you need to fork this repository and follow the steps in `Updating` section.


## Updating

If you this repository is abandoned and you can't reach me to update it, this is how to make a fresh version:

* Download the latest version of caddy without plugins and for platform `linux64` (currenty this download is located [here](https://caddyserver.com/download/build?os=linux&arch=amd64&features=))
* Untar the caddy data to folder `caddy` in the repository's root
* Tag the new version: `git tag 0.8.1`
* Push the new tag: `git push --tags`
* If necessary, update configuration at [Docker Hub](https://hub.docker.com/r/jojomi/caddy/)


## See Also

* https://github.com/jumanjihouse/docker-caddy
