FROM ubuntu:14.04
MAINTAINER Dominik Sander

ADD scripts/setup /scripts/setup
RUN chmod 755 /scripts/setup
RUN /scripts/setup

WORKDIR /app

ADD scripts/init /scripts/init
RUN chmod 755 /scripts/init

EXPOSE 3000

CMD ["/scripts/init"]
