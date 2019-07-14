FROM taitounited/taito-cli-deps:ci
MAINTAINER Taito United <support@taitounited.fi>

# TODO: Backwards compatibility for auth sessions. Remove later.
RUN mkdir -p /builder/google-cloud-sdk/bin && \
    ln -s /usr/bin/gcloud /builder/google-cloud-sdk/bin/gcloud

# Install extra packages not needed on CI/CD
RUN apt-get -y update && \
    apt-get -y install \
      perl-doc \
      less \
      telnet \
      jq \
      apache2-utils \
      vim \
      nano \
      wamerican \
      groff \
      dnsutils && \
    rm -rf /var/lib/apt/lists/*
ENV EDITOR=/bin/nano

# Install some global npm packages
RUN npm install depcheck npm-check -g

# Install terraform
ENV TERRAFORM_VERSION 0.12.1
WORKDIR /terraform
RUN curl -o terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform.zip && \
    mv terraform /usr/local/bin/terraform && \
    rm -rf /terraform
WORKDIR /tmp

# Install ansible
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" \
      >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
    (apt-get -y update || :) && \
    apt-get -y install ansible && \
    rm -rf /var/lib/apt/lists/*

# Install gcsfuse for mounting google cloud storage buckets
# TODO create a separate gcloud image?
# RUN echo "deb http://packages.cloud.google.com/apt gcsfuse-stretch main" | \
#       tee /etc/apt/sources.list.d/gcsfuse.list; \
#     curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
#       apt-key add - && \
#     apt-get -y update && \
#     apt-get -y install gcsfuse && \
#     rm -rf /var/lib/apt/lists/*
