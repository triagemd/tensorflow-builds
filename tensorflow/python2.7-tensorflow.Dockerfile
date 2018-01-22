FROM python:2.7

ARG TENSORFLOW_VERSION
RUN pip install --no-cache-dir tensorflow==$TENSORFLOW_VERSION