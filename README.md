# xandai/jsbsim-debian

[Docker Hub Link](https://hub.docker.com/r/xandai/jsbsim-debian)

[GitHub Link](https://github.com/x-and-ai/jsbsim-debian)

## Description

This is a Docker image for using JSBSim with Jupyter Lab on Debian.

## Tags and Versions

| tag        | jsbsim     | jupyterlab | python     | debian     |
|:----------:|:----------:|:----------:|:----------:|:----------:|
| 1.0.1      | 1.1.6      | 3.0.16     | 3.7.3      | 10.9       |
| 1.0.0      | 1.1.6      | 3.0.16     | 3.7.3      | 10.9       |

## Usage

- Start Jupyter Lab without token

``` sh
docker run --rm -it -p <localhostport>:8888 -v /absolute/path/to/workdir:/home/jupyter/workdir xandai/jsbsim-debian:1.0.1 jupyter lab --ServerApp.token=''
```

- Start Jupyter Lab with token

``` sh
docker run --rm -it -p <localhostport>:8888 -v /absolute/path/to/workdir:/home/jupyter/workdir xandai/jsbsim-debian:1.0.1
```
