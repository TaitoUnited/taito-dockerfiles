FROM python:3.7

ENV VERSION 0.92

RUN echo 'deb http://apt.qvarnlabs.net/debian stretch main' >> /etc/apt/sources.list
COPY ./apt* /var/lib/apt/lists/
RUN apt update
RUN apt install -y qvarn-jsonb gunicorn3 python3-slog python3-apifw python3-psycopg2

RUN mkdir /var/log/qvarn

CMD start_qvarn
