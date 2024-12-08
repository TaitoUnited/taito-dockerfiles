FROM ghcr.io/actions/actions-runner:2.321.0
# FROM ghcr.io/sergelogvinov/github-actions-runner:2.321.0

# Pull taito-cli image on start
ENV RUNNER_WAIT_FOR_DOCKER_IN_SECONDS 10
RUN sed -i '/updateFile="update.finished"/a docker pull $TAITO_CLI_IMAGE' /home/runner/run-helper.sh.template
