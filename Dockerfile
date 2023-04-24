FROM mcr.microsoft.com/dotnet/nightly/aspnet:6.0.15-alpine3.17-amd64
LABEL MAINTAINER "mark.hsieh <qqzcmark@gmail.com>"

## install package
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk update 
RUN apk add --no-cache procps net-tools bash
RUN apk add --no-cache tzdata git
RUN apk add --upgrade supervisor

## setting network
COPY utility_loopback.sh .
RUN chmod +x ./utility_loopback.sh
RUN ./utility_loopback.sh

COPY utility_namespace_dns.sh .
RUN chmod +x ./utility_namespace_dns.sh
RUN ./utility_namespace_dns.sh

## debug
## ref. : https://alpine.pkgs.org/3.17/alpine-main-x86_64/supervisor-4.2.4-r0.apk.html
## ref. : https://zhuanlan.zhihu.com/p/464563619
RUN mv /etc/supervisord.conf /etc/supervisord.example.conf
RUN cat /etc/supervisord.example.conf | grep -v '^;' | tr -s "\n" > /etc/supervisord.conf
RUN echo "show supervisor setting." && cat /etc/supervisord.example.conf && echo ""

CMD ["supervisord"]
