FROM ghcr.io/sergelogvinov/github-actions-runner:2.321.0
# FROM ghcr.io/actions/actions-runner:latest

USER root

# Install nodejs, otherwise actions/checkout@v4 will fail.
RUN apt-get -qqy update && \
    apt-get -qqy install build-essential && \
    export NODEJS_VERSION=${NODEJS_VERSION:-20.x} && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key \
     | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODEJS_VERSION nodistro main" \
     > /etc/apt/sources.list.d/nodesource.list && \
    apt-get -qqy update && apt-get -qqy install nodejs && \
    apt-get -qqy --purge remove build-essential && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    (npm config set -g spin=false || :) && \
    npm config set -g progress=false

# Custom chart executes builds on /builds: https://github.com/sergelogvinov/helm-charts/blob/main/charts/github-actions-runner/templates/autoscalingrunnerset.yaml#L154
# RUN mkdir -p /builds && chown runner:runner /builds

# Pull taito-cli:ci-gcp-dev on start
# RUN sed -i '/updateFile="update.finished"/a docker pull ghcr.io/taitounited/taito-cli:ci-gcp-dev' /home/runner/run-helper.sh.template

USER runner
