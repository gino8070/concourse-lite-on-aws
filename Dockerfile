FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
      build-essential \
      curl \
      jq \
      libxslt1-dev \
      libssl-dev \
      libreadline7 \
      libreadline-dev \
      libyaml-dev \
      libsqlite3-dev \
      unzip \
      openssl \
      ruby \
      ruby-dev \
      sqlite3 \
      zlibc \
      zlib1g-dev

RUN curl -L -s \
      https://github.com/cloudfoundry/bosh-cli/releases/download/v6.1.1/bosh-cli-6.1.1-linux-amd64 \
      -o /usr/local/bin/bosh && \
    chmod +x /usr/local/bin/bosh

RUN curl -s https://releases.hashicorp.com/terraform/0.12.13/terraform_0.12.13_linux_amd64.zip \
      -o /tmp/terraform.zip && \
    unzip /tmp/terraform.zip -d /usr/local/bin/ && \
    rm /tmp/terraform.zip && \
    chmod +x /usr/local/bin/terraform

RUN mkdir /workspace
WORKDIR /workspace