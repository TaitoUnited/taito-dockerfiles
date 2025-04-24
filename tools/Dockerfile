FROM python:3.13-slim

RUN apt-get update && \
  apt-get install --no-install-recommends -y \
    curl \
  # clean up
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

RUN pip3 install duckdb azure-storage-blob

COPY bin/* /usr/local/bin

RUN adduser --uid 1001 worker
USER 1001
