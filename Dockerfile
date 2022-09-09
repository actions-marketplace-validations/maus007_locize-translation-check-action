FROM python:3.9.14-alpine3.16

RUN mkdir -p /home/app/

WORKDIR /home/app/

COPY ./main.py /home/app/
COPY ./requirements.txt /home/app
COPY ./docker-enytpoint.sh /docker-enytpoint.sh

RUN chmod +x /docker-enytpoint.sh

RUN pip install --no-cache-dir -r requirements.txt


ENTRYPOINT ["/docker-enytpoint.sh"]