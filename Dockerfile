FROM python:3.9.14-alpine3.16

RUN mkdir -p /github/workspace/

WORKDIR /github/workspace/

COPY ./main.py /github/workspace/
COPY ./requirements.txt /github/workspace/
COPY ./docker-enytpoint.sh /docker-enytpoint.sh

RUN chmod +x /docker-enytpoint.sh

RUN pip install --no-cache-dir -r requirements.txt


ENTRYPOINT ["/docker-enytpoint.sh"]