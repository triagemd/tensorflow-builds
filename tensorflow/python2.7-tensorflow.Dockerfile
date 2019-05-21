FROM ubuntu:18.04

# Install Python
RUN apt-get -y update && \
    apt-get install -y python python-dev python-pip python-virtualenv wget curl && \
    apt-get clean && \
    python -m pip install --no-cache-dir --upgrade pip wheel

ARG TENSORFLOW_VERSION
RUN pip install --no-cache-dir tensorflow==$TENSORFLOW_VERSION
