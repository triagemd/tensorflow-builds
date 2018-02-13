FROM triage/python2.7-tensorflow-optimized-gpu

RUN apt-get -y update && \
    apt-get install -y libgomp1 && \
    apt-get clean

ARG TENSORFLOW_SERVING_VERSION
RUN wget -O /usr/local/bin/tensorflow_model_server https://github.com/triagemd/tensorflow-builds/releases/download/tf-serving-$TENSORFLOW_SERVING_VERSION/tensorflow_model_server_optimized_gpu && \
    chmod +x /usr/local/bin/tensorflow_model_server
