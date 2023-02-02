FROM ubuntu:22.04

ENV container=docker \
    LC_ALL=C

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt install -y \
	curl \
	wget \
	nano \
	telnet \
	net-tools \
	ca-certificates \
	ssl-cert \
	postfix \
	postfix-pcre \
	postfix-mysql

ADD scripts/start.sh /start.sh
RUN chmod 755 /start.sh

CMD ["/bin/bash", "/start.sh"]
