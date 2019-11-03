FROM node:lts-buster-slim

# NOTE: modified version of https://raw.githubusercontent.com/cypress-io/cypress-docker-images/master/base/12.6.0/Dockerfile

RUN apt-get update && \
  apt-get install --no-install-recommends -y \
  libgtk2.0-0 \
  libgtk-3-0 \
  libnotify-dev \
  libgconf-2-4 \
  libnss3 \
  libxss1 \
  libasound2 \
  libxtst6 \
  xauth \
  xvfb \
  # install Chinese fonts
  # this list was copied from https://github.com/jim3ma/docker-leanote
  fonts-arphic-bkai00mp \
  fonts-arphic-bsmi00lp \
  fonts-arphic-gbsn00lp \
  fonts-arphic-gkai00mp \
  fonts-arphic-ukai \
  fonts-arphic-uming \
  ttf-wqy-zenhei \
  ttf-wqy-microhei \
  xfonts-wqy \
  # clean up
  && rm -rf /var/lib/apt/lists/*

RUN npm install -g npm@latest
ENV TERM xterm
ENV npm_config_loglevel warn
ENV npm_config_unsafe_perm true

# Pre-install Cypress so that it is stored in global cache: /root/.cache/Cypress
WORKDIR /tmp/cypress
RUN echo '{}' > package.json && npm install cypress@3.6.0
WORKDIR /
RUN rm -rf /tmp/cypress
