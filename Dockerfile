FROM ubuntu:14.04
MAINTAINER Dominik Sander

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:git-core/ppa && \
    add-apt-repository -y ppa:brightbox/ruby-ng && \
    apt-get update && \
    apt-get install -y build-essential checkinstall git-core \
      zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libreadline-dev \
      libncurses5-dev libffi-dev libxml2-dev libxslt-dev libcurl4-openssl-dev libicu-dev \
      graphviz libgraphviz-dev \
      libmysqlclient-dev libpq-dev libsqlite3-dev \
      ruby2.2 ruby2.2-dev && \
    gem install --no-ri --no-rdoc bundler && \
    rm -rf /var/lib/apt/lists/*

ADD scripts/setup /scripts/setup
RUN chmod 755 /scripts/setup
RUN /scripts/setup

WORKDIR /app

ADD scripts/init /scripts/init
RUN chmod 755 /scripts/init

EXPOSE 3000

CMD ["/scripts/init"]

