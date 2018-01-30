ARG CUDA_VERSION
FROM nvidia/cuda:${CUDA_VERSION}-cudnn7-runtime-ubuntu16.04

# Install Python
RUN apt-get -y update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:jonathonf/python-3.6 && \
    apt-get -y update && \
    apt-get install -y python3.6 python3.6-dev python3-pip python3.6-venv wget && \
    apt-get clean && \
    python3.6 -m pip install --no-cache-dir --upgrade pip wheel && \
    cd /usr/bin && \
    rm -f python pip idle pydoc python2-config && \
    ln -s idle3.6 idle && \
    ln -s pydoc3.6 pydoc && \
    ln -s python3.6 python && \
    ln -s python3.6-config python-config && \
    ln -s pip3.6 pip

ENV LD_LIBRARY_PATH /usr/local/lib:/usr/local/cuda/lib64:/usr/local/cuda/lib64/stubs:/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH

# Fix paths so CUDA and CUDNN can be found
# See https://github.com/tensorflow/tensorflow/issues/14573, https://github.com/tensorflow/tensorflow/issues/8264
RUN mkdir /usr/lib/x86_64-linux-gnu/include/ && \
    ln -s /usr/lib/x86_64-linux-gnu/libcudnn.so /usr/local/cuda/lib64/libcudnn.so && \
    ln -s /usr/lib/x86_64-linux-gnu/libcudnn.so.7 /usr/local/cuda/lib64/libcudnn.so.7
