FROM alpine:3.22

ENV API_PASSWORD=""
ENV ADMIN_PASSWORD=""

ENV SHUTDOWN_CMD="echo 'System shutdown not configured'"

ENV UPS_COUNT=2

RUN apk update
RUN apk add bash
RUN apk add nut libusb-dev
RUN install -d -m 750 -o nut -g nut /var/run/nut

COPY docker-entrypoint /usr/local/bin/
ENTRYPOINT ["docker-entrypoint"]

WORKDIR /var/run/nut

EXPOSE 3493
