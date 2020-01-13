FROM python:3.7-alpine3.10

RUN apk --no-cache add --virtual \
      .builddeps \
      lapack \
      libstdc++ \
      g++ \
      gcc \      
      gfortran \
      libressl-dev \
      musl-dev \      
      libffi-dev \
      musl-dev \
      lapack-dev && \
      apk --no-cache add \
      py3-scipy && \
#    apk del .builddeps && \
    python -m pip install --no-cache-dir --upgrade pip setuptools wheel && \
    rm -rf /root/.cache

RUN python -m pip install --upgrade pip
ENV PYTHONPATH=/usr/lib/python3.7/site-packages

RUN mkdir /install
WORKDIR /install
COPY requirements.txt /requirements.txt
RUN python -m pip install -r /requirements.txt