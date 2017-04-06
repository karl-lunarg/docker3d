#!/bin/sh

COMMAND=/bin/bash

xhost + # allow connections to X server
#docker run --privileged -e "DISPLAY=unix:0.0" -v="/tmp/.X11-unix:/tmp/.X11-unix:rw"  -v /home/karl/src/Vulkan-LoaderAndValidationLayers:/vulkan -i -t ubuntu_with_nvidia_driver $COMMAND



docker run \
	--privileged \
	--device /dev/nvidiactl \
	--device /dev/nvidia0 \
	--device /dev/snd \
	-e "DISPLAY=unix:0.0" \
	-v="/tmp/.X11-unix:/tmp/.X11-unix:rw"  \
	-v /home/karl/src/Vulkan-LoaderAndValidationLayers:/vulkan \
	-i \
	-t ubuntu_with_nvidia_driver \
	$COMMAND
