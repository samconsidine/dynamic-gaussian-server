
sudo docker run -id --name gaussians --net=host -e DISPLAY=:0 -v $HOME/.Xauthority:/root/.Xauthority -e NVIDIA_VISIBLE_DEVICES=all -e NVIDIA_DRIVER_CAPABILITIES=all -v /home/zsx/workspace:/workspace --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --gpus all --runtime=nvidia --env="QT_X11_NO_MITSHM=1" -it nvidia/cuda:11.6.2-devel-ubuntu20.04 /bin/bash`

