#FROM python:3.7.3-stretch 
#RUN apt-get update && apt-get upgrade -y
#RUN apt-get install python3-dev unixodbc-dev -y
#RUN pip install --upgrade pip
#COPY requirements.txt /requirements.txt
#RUN pip install -r /requirements.txt

FROM ronnya/py-base-stretch

RUN mkdir /app
COPY source /app

WORKDIR /app

RUN echo "python foo.py\n/bin/cat sample.csv" > run.sh

CMD ["/bin/sh","run.sh"]
#CMD ["python", "foo.py"]
