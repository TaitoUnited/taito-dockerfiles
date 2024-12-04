FROM ghcr.io/sergelogvinov/github-actions-runner:2.321.0

# Pull taito-cli:ci-gcp-dev on start
ENV RUNNER_WAIT_FOR_DOCKER_IN_SECONDS 10
RUN sed -i '/updateFile="update.finished"/a docker pull taitounited/taito-cli:ci-gcp-dev' /home/runner/run-helper.sh.template
