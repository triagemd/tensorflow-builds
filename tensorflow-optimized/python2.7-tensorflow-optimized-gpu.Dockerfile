FROM triage/python2.7-cuda9.1-mkl

ARG TENSORFLOW_VERSION
RUN pip install --no-cache-dir https://github.com/mind/wheels/releases/download/tf$TENSORFLOW_VERSION-gpu-cuda91/tensorflow-$TENSORFLOW_VERSION-cp27-cp27mu-linux_x86_64.whl
