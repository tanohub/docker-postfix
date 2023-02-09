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

RUN groupadd -g 5000 vmail ; \
	useradd -g vmail -u 5000 vmail -d /home/vmail -m  -s /sbin/nologin ; \
	chgrp postfix /home/vmail

CMD ["/bin/bash", "/start.sh"]
