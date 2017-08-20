Tensorflow Docker images compiled with GPU support and CPU-optimizations.

# Building and running

## GPU

```bash
nvidia-docker run -rm -i --tty triage/python3.6-tensorflow:latest nvidia-smi
nvidia-docker run -rm -i --tty triage/python3.6-tensorflow:latest python -c "from tensorflow.python.client import device_lib; print(device_lib.list_local_devices())"
```

----

Setting up Docker on a new Ubuntu 16.04 Xenial environment:

```bash
#!/usr/bin/env bash
sudo apt-get -y install dirmngr software-properties-common apt-transport-https
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get -y update
apt-cache policy docker-engine
sudo apt-get install -y docker-engine

sudo usermod -aG docker $USER
#sudo su - $USER

# Install nvidia-docker and nvidia-docker-plugin
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1-1_amd64.deb
sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb
```

Exit and start a new shell for Docker permissions.
