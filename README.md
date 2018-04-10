# tensorflow-builds

Tensorflow binaries and Docker images compiled with GPU support and CPU optimizations.

We now pull optimized Tensorflow wheels from [mind/wheels](https://github.com/mind/wheels) rather than building our own.

## Updating Tensorflow version

When a new version of Tensorflow is released:
1. Update the versions at the top of `script/distribute*`.
2. On a *very powerful* machine with Docker, set `$GITHUB_TOKEN` to [a GitHub access token with repo permissions](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/) and run `script/distribute-binaries` (seriously, crank the CPU all the way up if using the cloud).
3. Update the binary links below from https://github.com/triagemd/tensorflow-builds/releases.
4. Push to master.

---

| Docker builds |
|-|
| [![Travis](https://travis-ci.org/triagemd/tensorflow-builds.svg?branch=master)](https://travis-ci.org/triagemd/tensorflow-builds) |

| Binary | |
|-|-|
| **Tensorflow Serving 1.6:** |
| CPU optimized, with Intel MKL | https://github.com/triagemd/tensorflow-builds/releases/download/tf-serving-1.6.0/tensorflow_model_server_optimized |
| GPU, CUDA 9.0, without CPU optimization | https://github.com/triagemd/tensorflow-builds/releases/download/tf-serving-1.6.0/tensorflow_model_server_gpu |
| GPU, CUDA 9.1, with CPU optimization, with Intel MKL | https://github.com/triagemd/tensorflow-builds/releases/download/tf-serving-1.6.0/tensorflow_model_server_optimized_gpu |
| **Tensorflow Serving 1.5:** |
| CPU optimized, with Intel MKL | https://github.com/triagemd/tensorflow-builds/releases/download/tf-serving-1.5.0/tensorflow_model_server_optimized |
| GPU, CUDA 9.0, without CPU optimization | https://github.com/triagemd/tensorflow-builds/releases/download/tf-serving-1.5.0/tensorflow_model_server_gpu |
| GPU, CUDA 9.1, with CPU optimization, with Intel MKL | https://github.com/triagemd/tensorflow-builds/releases/download/tf-serving-1.5.0/tensorflow_model_server_optimized_gpu |

| Docker image | |
|-|-|
| **Python + Intel MKL-DNN:** |
| python2.7-mkl | [![Docker Pulls](https://img.shields.io/docker/pulls/triage/python2.7-mkl.svg)](https://hub.docker.com/r/triage/python2.7-mkl/) |
| python3.6-mkl | [![Docker Pulls](https://img.shields.io/docker/pulls/triage/python3.6-mkl.svg)](https://hub.docker.com/r/triage/python3.6-mkl/) |
| **Python + CUDA:** |
| python2.7-cuda9.0 | [![Docker Pulls](https://img.shields.io/docker/pulls/triage/python2.7-cuda9.0.svg)](https://hub.docker.com/r/triage/python2.7-cuda9.0/) |
| python3.6-cuda9.0 | [![Docker Pulls](https://img.shields.io/docker/pulls/triage/python3.6-cuda9.0.svg)](https://hub.docker.com/r/triage/python3.6-cuda9.0/) |
| python2.7-cuda9.1 | [![Docker Pulls](https://img.shields.io/docker/pulls/triage/python2.7-cuda9.1.svg)](https://hub.docker.com/r/triage/python2.7-cuda9.1/) |
| python3.6-cuda9.1 | [![Docker Pulls](https://img.shields.io/docker/pulls/triage/python3.6-cuda9.1.svg)](https://hub.docker.com/r/triage/python3.6-cuda9.1/) |
| **Python + CUDA + Intel MKL-DNN:** |
| python2.7-cuda9.1-mkl | [![Docker Pulls](https://img.shields.io/docker/pulls/triage/python2.7-cuda9.1-mkl.svg)](https://hub.docker.com/r/triage/python2.7-cuda9.1-mkl/) |
| python3.6-cuda9.1-mkl | [![Docker Pulls](https://img.shields.io/docker/pulls/triage/python3.6-cuda9.1-mkl.svg)](https://hub.docker.com/r/triage/python3.6-cuda9.1-mkl/) |
| **Tensorflow:** |
| python2.7-tensorflow | [![Docker Pulls](https://img.shields.io/docker/pulls/triage/python2.7-tensorflow.svg)](https://hub.docker.com/r/triage/python2.7-tensorflow/) |
| python3.6-tensorflow | [![Docker Pulls](https://img.shields.io/docker/pulls/triage/python3.6-tensorflow.svg)](https://hub.docker.com/r/triage/python3.6-tensorflow/) |
| python2.7-tensorflow-gpu | [![Docker Pulls](https://img.shields.io/docker/pulls/triage/python2.7-tensorflow-gpu.svg)](https://hub.docker.com/r/triage/python2.7-tensorflow-gpu/) |
| python3.6-tensorflow-gpu | [![Docker Pulls](https://img.shields.io/docker/pulls/triage/python3.6-tensorflow-gpu.svg)](https://hub.docker.com/r/triage/python3.6-tensorflow-gpu/) |
| **Tensorflow with CPU optimizations:** |
| python2.7-tensorflow-optimized | [![Docker Pulls](https://img.shields.io/docker/pulls/triage/python2.7-tensorflow-optimized.svg)](https://hub.docker.com/r/triage/python2.7-tensorflow-optimized/) |
| python3.6-tensorflow-optimized | [![Docker Pulls](https://img.shields.io/docker/pulls/triage/python3.6-tensorflow-optimized.svg)](https://hub.docker.com/r/triage/python3.6-tensorflow-optimized/) |
| python2.7-tensorflow-optimized-gpu | [![Docker Pulls](https://img.shields.io/docker/pulls/triage/python2.7-tensorflow-optimized-gpu.svg)](https://hub.docker.com/r/triage/python2.7-tensorflow-optimized-gpu/) |
| python3.6-tensorflow-optimized-gpu | [![Docker Pulls](https://img.shields.io/docker/pulls/triage/python3.6-tensorflow-optimized-gpu.svg)](https://hub.docker.com/r/triage/python3.6-tensorflow-optimized-gpu/) |
| **Tensorflow Serving:** |
| python2.7-tensorflow-serving | [![Docker Pulls](https://img.shields.io/docker/pulls/triage/python2.7-tensorflow-serving.svg)](https://hub.docker.com/r/triage/python2.7-tensorflow-serving/) |
| python2.7-tensorflow-serving-optimized | [![Docker Pulls](https://img.shields.io/docker/pulls/triage/python2.7-tensorflow-serving-optimized.svg)](https://hub.docker.com/r/triage/python2.7-tensorflow-serving-optimized/) |
| python2.7-tensorflow-serving-gpu | [![Docker Pulls](https://img.shields.io/docker/pulls/triage/python2.7-tensorflow-serving-gpu.svg)](https://hub.docker.com/r/triage/python2.7-tensorflow-serving-gpu/) |
| python2.7-tensorflow-serving-optimized-gpu | [![Docker Pulls](https://img.shields.io/docker/pulls/triage/python2.7-tensorflow-serving-optimized-gpu.svg)](https://hub.docker.com/r/triage/python2.7-tensorflow-serving-optimized-gpu/) |
