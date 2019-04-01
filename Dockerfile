FROM ubuntu 
LABEL maintainer="TopCat <topmailcat@googlemail.com>" 

ENV DEBIAN_FRONTEND noninteractive

# update system
RUN apt-get update && apt-get upgrade -y

# install openvpn
RUN  apt-get install openvpn -y

# enable ip forward
RUN echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf \
    && sysctl -p

# copy files
COPY entrypoint.sh /entrypoint.sh
CMD [ "/entrypoint.sh" ]

EXPOSE 1194
VOLUME /etc/openvpn/