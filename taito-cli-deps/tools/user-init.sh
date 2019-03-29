#!/bin/bash

username=${1}

su "${username}" -s /bin/sh -c "
  helm init --client-only &&
  helm repo add taito-charts https://taitounited.github.io/taito-charts/
"
