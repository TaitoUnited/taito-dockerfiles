FROM ghcr.io/actions/actions-runner:latest

# Pull taito-cli:ci-gcp-dev on start
RUN sed -i '/updateFile="update.finished"/a docker pull ghcr.io/taitounited/taito-cli:ci-gcp-dev' /home/runner/run-helper.sh.template
