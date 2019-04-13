FROM debian:stretch
MAINTAINER Taito United <support@taitounited.fi>

USER root
COPY . /taito-cli-deps
WORKDIR /tmp
RUN apt-get clean

# Install some basic stuff required by the following steps and by some plugins
RUN echo "deb http://http.debian.net/debian stretch-backports main" >> \
      /etc/apt/sources.list && \
    apt-get -y update && \
    apt-get -y install build-essential cpanminus perl perl-doc curl wget \
      gnupg2 unzip less telnet jq apache2-utils vim nano wamerican
ENV EDITOR=/bin/nano

# Install docker (required for executing CI/CD builds on container)
RUN apt-get -y update && \
    apt-get -y install apt-transport-https ca-certificates \
      software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
      add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/debian \
      $(lsb_release -cs) \
      stable" && \
    apt-get -y update && \
    apt-get -y install docker-ce

# Install node.js
ENV NODEJS_VERSION 10.x
RUN curl -sL https://deb.nodesource.com/setup_${NODEJS_VERSION} | bash - && \
    apt-get -y update && apt-get -y install nodejs build-essential
RUN npm config set spin=false && \
    npm config set progress=false

# Install some global npm packages
RUN npm install depcheck npm-check -g

# Install openjdk
# ENV JAVA_VERSION 8
# RUN apt-get -y update && apt-get -y install openjdk-${JAVA_VERSION}-jdk

# Install helm
RUN curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get \
      > get_helm.sh && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh && \
    rm ./get_helm.sh

# Install postgres and mysql client
RUN apt-get -y update && \
    apt-get -y install postgresql-client mysql-client

# Install sqitch
RUN apt-get -y update && \
    apt-get -y install libdbd-pg-perl libdatetime-perl libclone-perl \
      libperlio-utf8-strict-perl libhash-merge-perl && \
    cpanm --quiet --notest App::Sqitch

# Install ansible
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" \
      >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
    apt-get -y update && \
    apt-get -y install ansible

# Install terraform
ENV TERRAFORM_VERSION 0.11.13
WORKDIR /terraform
RUN curl -o terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform.zip && \
    mv terraform /usr/local/bin/terraform
WORKDIR /tmp
RUN rm -rf /terraform

# Install gcloud
# TODO create a separate gcloud image?
RUN mkdir /builder
WORKDIR /builder
RUN apt-get -y update && \
    apt-get -y install gcc python2.7 python-dev python-setuptools \
      ca-certificates software-properties-common && \
      # python-software-properties && \

    # Install Git
    echo "deb http://ftp.us.debian.org/debian testing main contrib non-free" \
      >> /etc/apt/sources.list && \
      apt-get update && \
      apt-get install -y git && \
      apt-get clean all && \

    # Setup Google Cloud SDK
    curl https://dl.google.com/dl/ && \
    curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz | \
      tar zxv -C /builder && \
    CLOUDSDK_PYTHON="python2.7" /builder/google-cloud-sdk/install.sh \
        --usage-reporting=false \
        --bash-completion=false \
        --disable-installation-options && \

    # Install additional components
    /builder/google-cloud-sdk/bin/gcloud -q components install \
        alpha beta kubectl && \
    /builder/google-cloud-sdk/bin/gcloud -q components update && \

    # install crcmod
    easy_install -U pip && \
    pip install -U crcmod && \

    # Clean up
    apt-get -y remove gcc python-dev python-setuptools && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf ~/.config/gcloud
ENV PATH=/builder/google-cloud-sdk/bin/:$PATH
WORKDIR /tmp

# Install gcloud sql proxy
# TODO create a separate gcloud image?
RUN curl https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 \
      > cloud_sql_proxy && \
    chmod +x cloud_sql_proxy && \
    mv cloud_sql_proxy /usr/local/bin

# Install gcsfuse for mounting google cloud storage buckets
# TODO create a separate gcloud image?
# RUN echo "deb http://packages.cloud.google.com/apt gcsfuse-stretch main" | \
#       tee /etc/apt/sources.list.d/gcsfuse.list; \
#     curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
#       apt-key add - && \
#     apt-get -y update && \
#     apt-get -y install gcsfuse

# Install bats for taito-cli unit testing
RUN git clone https://github.com/bats-core/bats-core.git && \
    ./bats-core/install.sh /usr/local && \
    rm -rf bats-core

# Clean up
RUN rm -rf /var/lib/apt/lists/* && \
    # TODO apt-get autoremove -y && \
    apt-get clean

# Initialize root user
RUN /taito-cli-deps/tools/user-init.sh root

ENTRYPOINT ["bash"]
