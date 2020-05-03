FROM alpine

RUN apk add --no-cache python3 uwsgi-python3 uwsgi-http

ADD main.py requirements.txt /

RUN pip3 install -r requirements.txt

CMD [ "uwsgi", "--plugins", "python3,http", \
               "--http", "0.0.0.0:5000", \
               "--uid", "uwsgi", \
               "--module", "main:app" ]

