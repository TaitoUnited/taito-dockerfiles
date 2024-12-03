FROM ghcr.io/actions/actions-runner:latest

USER root

# Custom chart executes builds on /builds: https://github.com/sergelogvinov/helm-charts/blob/main/charts/github-actions-runner/templates/autoscalingrunnerset.yaml#L154
RUN mkdir -p /builds && chown runner:runner /builds

# Pull taito-cli:ci-gcp-dev on start
# RUN sed -i '/updateFile="update.finished"/a docker pull ghcr.io/taitounited/taito-cli:ci-gcp-dev' /home/runner/run-helper.sh.template

USER runner
