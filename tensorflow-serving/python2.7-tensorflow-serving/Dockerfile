FROM python:2.7

# Build optimized tensorflow-serving and install
ARG TENSORFLOW_SERVING_VERSION
RUN echo "deb [arch=amd64] http://storage.googleapis.com/tensorflow-serving-apt stable tensorflow-model-server tensorflow-model-server-universal" | tee /etc/apt/sources.list.d/tensorflow-serving.list  && \
    curl https://storage.googleapis.com/tensorflow-serving-apt/tensorflow-serving.release.pub.gpg | apt-key add - && \
    apt-get -y update && \
    apt-get -y install tensorflow-model-server=$TENSORFLOW_SERVING_VERSION && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
