FROM triage/python3.6-mkl

ARG TENSORFLOW_VERSION
RUN pip install --no-cache-dir https://github.com/mind/wheels/releases/download/tf$TENSORFLOW_VERSION-cpu/tensorflow-$TENSORFLOW_VERSION-cp36-cp36m-linux_x86_64.whl
