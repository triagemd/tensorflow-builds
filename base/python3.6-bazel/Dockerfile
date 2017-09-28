ARG BAZEL_VERSION=latest
FROM triage/ubuntu16.04-bazel:${BAZEL_VERSION}

# Install Python
RUN apt-get -y update && \
    apt-get install -y software-properties-common vim && \
    add-apt-repository ppa:jonathonf/python-3.6 && \
    apt-get -y update && \
    apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv && \
    apt-get install -y git && \
    python3.6 -m pip install pip --upgrade && \
    python3.6 -m pip install wheel && \
    cd /usr/bin && \
    rm -f python pip idle pydoc python2-config && \
    ln -s idle3.6 idle && \
    ln -s pydoc3.6 pydoc && \
    ln -s python3.6 python && \
    ln -s python3.6-config python-config && \
    ln -s pip3.6 pip
