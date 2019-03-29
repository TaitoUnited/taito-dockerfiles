#!/bin/bash

username=${1}
uid=${2}
gid=${3}

# Make sure that some group exists with the given gid
groupadd --gid "${gid}" taitogroup 2> /dev/null

# Add user
useradd --system --uid "${uid}" --gid "${gid}" -m --shell /bin/bash "${username}" && \
  su "${username}" -s /bin/sh -c "echo ok"
