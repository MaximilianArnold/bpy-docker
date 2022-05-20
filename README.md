# bpy-docker
This is a github repository to install with a Cuda docker the blender wheel package

# How to build
docker build -t bpy-docker .

# How to run
docker run --rm -it --gpus all -v /:/workspace/  -p 52710:52710 --name bpy-docker-1  bpy-docker y bash

