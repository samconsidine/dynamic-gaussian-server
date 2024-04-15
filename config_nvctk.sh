curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

sed -i -e '/experimental/ s/^#//g' /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit

sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker

mkdir -p $HOME/.config/docker
nvidia-ctk runtime configure --runtime=docker --config=$HOME/.config/docker/daemon.json
systemctl --user restart docker
sudo nvidia-ctk config --set nvidia-container-cli.no-cgroups --in-place

sudo docker pull nvidia/cuda:11.6.2-devel-ubuntu20.04
sudo docker run --gpus all --runtime=nvidia -it nvidia/cuda:11.6.2-devel-ubuntu20.04

# sudo docker run -id --name gaussians --net=host -e DISPLAY=:0 -v $HOME/.Xauthority:/root/.Xauthority -e NVIDIA_VISIBLE_DEVICES=all -e NVIDIA_DRIVER_CAPABILITIES=all -v /home/zsx/workspace:/workspace --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --gpus all --runtime=nvidia --env="QT_X11_NO_MITSHM=1" -it nvidia/cuda:11.6.2-devel-ubuntu20.04 /bin/bash`
