FROM  mcr.microsoft.com/dotnet/core/aspnet:2.2.8-alpine3.10
LABEL MAINTAINER "mark.hsieh <qqzcmark@gmail.com>"

RUN mkdir -p /usr/local/src
WORKDIR /usr/local/src

## install package
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk update 
RUN apk add --no-cache procps net-tools bash
RUN apk add --no-cache tzdata git vim
RUN apk add --no-cache curl wget
RUN apk add --upgrade supervisor
RUN rm -rf /var/cache/apk/*

## setting network
COPY utility_loopback.sh .
RUN chmod +x ./utility_loopback.sh
RUN ./utility_loopback.sh

COPY utility_namespace_dns.sh .
RUN chmod +x ./utility_namespace_dns.sh
RUN ./utility_namespace_dns.sh

## install .Net Support: runtime .dll
COPY utility_dotnet_support.sh .
RUN chmod +x ./utility_dotnet_support.sh
RUN ./utility_dotnet_support.sh
 
## debug
## ref. : https://alpine.pkgs.org/3.17/alpine-main-x86_64/supervisor-4.2.4-r0.apk.html
## ref. : https://zhuanlan.zhihu.com/p/464563619
RUN mv /etc/supervisord.conf /etc/supervisord.example.conf
COPY ./supervisor_conf/default_supervisord.conf /etc/supervisord.conf
RUN echo "show supervisor setting." && cat /etc/supervisord.conf | grep -v '^;' | tr -s "\n" && echo ""
RUN mkdir -p /etc/supervisor.d/
RUN touch /run/supervisord.sock && chmod 777 /run/supervisord.sock

ENV PATH="$PATH:/usr/local/bin"
WORKDIR /usr/bin
EXPOSE 9001

CMD ["supervisord", "-c", "/etc/supervisord.conf"]
