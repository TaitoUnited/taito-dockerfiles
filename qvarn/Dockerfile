FROM python:3.7

ENV VERSION 0.92

WORKDIR /opt

RUN echo 'deb http://apt.qvarnlabs.net/debian stretch main' >> /etc/apt/sources.list
COPY ./apt* /var/lib/apt/lists/
RUN apt update
RUN apt install -y qvarn-jsonb gunicorn3

RUN mkdir /var/log/qvarn
RUN cat /etc/qvarn/qvarn.conf

CMD start_qvarn
