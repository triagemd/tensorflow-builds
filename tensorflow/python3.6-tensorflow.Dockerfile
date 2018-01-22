FROM python:3.6

ARG TENSORFLOW_VERSION
RUN pip install --no-cache-dir tensorflow==$TENSORFLOW_VERSION
