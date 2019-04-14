#!/bin/bash

username=${1}

su "${username}" -s /bin/sh -c "
  helm init --client-only &&
  helm plugin install https://github.com/rimusz/helm-tiller &&
  helm tiller start-ci &&
  helm repo add taito-charts https://taitounited.github.io/taito-charts/ &&
  helm tiller stop
"
