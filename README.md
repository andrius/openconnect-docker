Openconnect for Pulse VPN
=========================

# Quick start

Just specify your Pulse Secure VPN url through environment variable `VPN_URL` and execute openconnect as privileged container:

```bash
docker run -ti --rm --privileged=true --name openconnect \
  -e "VPN_URL=https://YOUR-CORPORATE-PULSES-ECURE-VPN.URL/dana-na/auth/url_default/welcome.cgi" \
  andrius/openconnect-docker
```

It will ask for username, password and 2FA (OTP) password, these should be entered by user interactively

After openconnect started, it's good idea to check its routing: `docker exec -ti openconnect bash` and `netstat -nr` within container.
