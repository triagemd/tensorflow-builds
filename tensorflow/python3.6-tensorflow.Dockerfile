FROM ubuntu:18.04

# Install Python
RUN apt-get -y update && \
    apt-get install -y python3 python3-dev python3-pip python-virtualenv wget curl && \
    apt-get clean && \
    python3 -m pip install --no-cache-dir --upgrade pip wheel && \
    cd /usr/bin && \
    rm -f python pip idle pydoc python2-config && \
    ln -s idle3 idle && \
    ln -s pydoc3 pydoc && \
    ln -s python3 python && \
    ln -s python3-config python-config && \
    ln -s pip3 pip

ARG TENSORFLOW_VERSION
RUN pip install --no-cache-dir tensorflow==$TENSORFLOW_VERSION
