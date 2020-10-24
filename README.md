# Docker

This docker image it to allow testing and usage of FEniCS in Julia.
It is based on https://github.com/ysimillides/fenics-julia-docker. 


## Running Docker

To run the docker image you can simply call

```sh
docker run -ti -v $PWD:/work doublemalt/fenics-julia-docker 
```

This also mounts the current working directory under `/work` inside the container.

Once inside, 'julia' can be accessed by calling

```sh
julia
```
on the command line

