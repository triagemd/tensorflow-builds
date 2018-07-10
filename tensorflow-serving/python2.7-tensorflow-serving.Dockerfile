FROM triage/python2.7-tensorflow

ARG TENSORFLOW_SERVING_VERSION
RUN wget https://storage.googleapis.com/tensorflow-serving-apt/pool/tensorflow-model-server/t/tensorflow-model-server/tensorflow-model-server_${TENSORFLOW_SERVING_VERSION}_all.deb -P /tmp/ && \
    dpkg -i /tmp/tensorflow-model-server_${TENSORFLOW_SERVING_VERSION}_all.deb && \
    rm /tmp/tensorflow-model-server_${TENSORFLOW_SERVING_VERSION}_all.deb
