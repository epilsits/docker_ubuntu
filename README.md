# docker_ubuntu

This Dockerfile will build an Ubuntu based container and install the required dependencies to compile the https://github.com/rdp/ffmpeg-windows-build-helpers project.

It will also make the following build customizations:
* By default, create user:group `docker:docker` with password `docker`. These can be changed using build arguments.
```
  docker build --build-arg user=user1 --build-arg group=group1 --build-arg password=pass1
```
* Install and configure the Solarized theme for `ls` and `vim`.
* Set `TERM` and `PS1` to enabled the colors in terminal.
