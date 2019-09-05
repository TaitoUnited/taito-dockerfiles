FROM python:3.7-alpine AS builder

ENV VERSION master

WORKDIR /opt
RUN apk add curl make gcc py3-virtualenv musl-dev libffi-dev postgresql-client postgresql-dev
RUN curl -L https://github.com/vaultit/qvarn/archive/$VERSION.zip -o qvarn.zip
RUN unzip qvarn.zip
RUN mv qvarn-$VERSION qvarn

WORKDIR /opt/qvarn
RUN make env3

CMD source ./env3/bin/activate && python3 ./qvarn-run --port 80
