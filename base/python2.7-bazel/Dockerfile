ARG BAZEL_VERSION=latest
FROM triage/ubuntu16.04-bazel:${BAZEL_VERSION}

# Install Python
RUN apt-get -y update && \
    apt-get install -y build-essential python python-dev python-pip python-virtualenv && \
    apt-get install -y git && \
    python -m pip install pip --upgrade && \
    python -m pip install wheel
