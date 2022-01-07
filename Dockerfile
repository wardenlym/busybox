FROM alpine:3.15

LABEL MAINTAINER wardenlym (wardenlym@gmail.com)

EXPOSE 80 443 1180 11443

RUN     apk update \
    &&  apk add bash bind-tools busybox-extras curl \
                iproute2 iputils jq mtr \
                net-tools nginx openssl \
                perl-net-telnet procps tcpdump tcptraceroute wget \
    &&  mkdir /certs /docker \
    &&  chmod 700 /certs \
    &&  openssl req \
        -x509 -newkey rsa:2048 -nodes -days 3650 \
        -keyout /certs/server.key -out /certs/server.crt -subj '/CN=localhost'

RUN mkdir -p /usr/share/nginx/html && echo "Busybox based on Alpine Linux @wardenlym" > /usr/share/nginx/html/index.html

COPY nginx.conf /etc/nginx/nginx.conf

COPY entrypoint.sh /docker/entrypoint.sh

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

ENTRYPOINT ["/bin/sh", "/docker/entrypoint.sh"]