FROM cypress/base:14.15.0

# Pre-install Cypress so that it is stored in global cache: /root/.cache/Cypress
WORKDIR /tmp/cypress
RUN echo '{}' > package.json && npm install cypress@6.1.0
WORKDIR /
RUN rm -rf /tmp/cypress
