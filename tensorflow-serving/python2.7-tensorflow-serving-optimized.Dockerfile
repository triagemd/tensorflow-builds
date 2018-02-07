FROM triage/python2.7-tensorflow-optimized

ARG TENSORFLOW_SERVING_VERSION
RUN wget -O /usr/local/bin/tensorflow_model_server https://github.com/triagemd/tensorflow-builds/releases/download/tf-serving-$TENSORFLOW_SERVING_VERSION/tensorflow_model_server_optimized && \
    chmod +x /usr/local/bin/tensorflow_model_server
