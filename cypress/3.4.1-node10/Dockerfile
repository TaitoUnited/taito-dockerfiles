FROM cypress/base:10
# Pre-install Cypress so that it is stored in global cache: /root/.cache/Cypress
WORKDIR /tmp/cypress
RUN echo '{}' > package.json && npm install cypress@3.4.1
WORKDIR /
RUN rm -rf /tmp/cypress
