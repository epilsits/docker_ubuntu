# docker_ubuntu

This Dockerfile will build an Ubuntu based container and install the required dependencies to compile the https://github.com/rdp/ffmpeg-windows-build-helpers project.

It will also make the following build customizations:
* By default, create user:group `docker:docker` with password `docker`. These can be changed using build arguments.

```
  docker build --build-arg user=user1 --build-arg group=group1 --build-arg password=pass1
```

* Install and configure the Solarized theme for `ls` and `vim`.
* Set `TERM` and `PS1` to enabled the colors in terminal.

### Example build command
`docker build -t ubuntu_base .`

Consider adding `--pull` to always pull the latest Ubuntu base image, or `--no-cache` to build all the steps without caching (such as updating the build dependencies).

### Run the container

`docker run -it --name ffubuntu ubuntu_base`

I suggest creating a data volume on which to keep the build environment, so that the image and container can be updated without losing the build progress.

`docker volume create datavol1`

Then in the `run` command

`docker run -it --name ffubuntu --mount src=datavol1,dst=/data ubuntu_base`

The volume will be mounted under `/data` in the container. Once the container is started, modify the `/data` mount to allow the `docker` user to write to it.

`sudo chmod 777 /data`
