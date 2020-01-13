FROM python:3.7-alpine as base
#FROM python:3.7 as base
FROM base as builder

RUN apk add g++
RUN apk add libffi-dev #For Python module "scipy" to work

RUN echo "http://dl-8.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk --no-cache --update-cache add gcc gfortran python python-dev py-pip build-base wget freetype-dev libpng-dev openblas-dev 
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h



RUN echo "http://dl-8.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
  && apk update \
  && apk add py3-numpy py3-pandas py3-scipy

RUN pip install numpy

RUN mkdir /install
WORKDIR /install
COPY requirements.txt /requirements.txt
RUN pip install --install-option="--prefix=/install" -r /requirements.txt
FROM base
COPY --from=builder /install /usr/local
COPY src /app
WORKDIR /app
CMD ["python", "", "foo.py"]