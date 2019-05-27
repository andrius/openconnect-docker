FROM alpine:edge

ENV VPN_URL      https://YOUR-CORPORATE-PULSES-ECURE-VPN.URL/dana-na/auth/url_default/welcome.cgi
ENV VPN_OPTIONS  --disable-ipv6 --protocol=nc --os=linux

RUN apk --update --allow-untrusted --repository http://dl-4.alpinelinux.org/alpine/edge/testing/ add \
      bash \
      openconnect \
&& rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

ADD pulsevpn.sh /
CMD ["/pulsevpn.sh"]
