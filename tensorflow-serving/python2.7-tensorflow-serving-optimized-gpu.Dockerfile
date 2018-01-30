FROM triage/python2.7-cuda9.1-mkl

ARG TENSORFLOW_SERVING_VERSION
RUN wget -O /usr/local/bin/tensorflow_model_serving https://github.com/triagemd/tensorflow-builds/releases/download/tf-serving-$TENSORFLOW_SERVING_VERSION/tensorflow_model_server_optimized_gpu
