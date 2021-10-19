FROM ubuntu:20.04

RUN apt-get update \ 
  && apt-get install -y freeradius-mysql wget \
  && rm -rf /var/lib/apt/lists/* 
  
WORKDIR /etc/freeradius

RUN rm -rf ./3.0/

RUN wget https://raw.githubusercontent.com/ricardolan85/vivavox-freeradius-server/main/radiusd.conf

EXPOSE 1812/udp

ENTRYPOINT ["/usr/sbin/freeradius","-d","/etc/freeradius","-X"]
