FROM python:3.13-slim

RUN pip3 install duckdb azure-storage-blob

COPY bin/* /usr/local/bin

RUN adduser --uid 1001 worker
USER 1001
