FROM python:3.9.14-alpine3.16

RUN mkdir -p /github/workspace/

WORKDIR /home/app/

COPY ./main.py /home/app/main.py
COPY ./requirements.txt  /home/app/requirements.txt
COPY ./docker-enytpoint.sh /docker-enytpoint.sh

RUN chmod +x /docker-enytpoint.sh

RUN pip install --no-cache-dir -r requirements.txt


#ENTRYPOINT ["/docker-enytpoint.sh"]

CMD ["python3", "/home/app/main.py"]