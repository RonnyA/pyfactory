#FROM python:3.7-alpine3.10
FROM python:3.7.3-stretch 

RUN apt-get update && apt-get upgrade -y
RUN apt-get install python3-dev unixodbc-dev -y
RUN pip install --upgrade pip

COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
