FROM alpine:3.2

# Install envsubst
RUN apk add --update bash gettext && rm -rf /var/cache/apk/*

COPY assets /
CMD ["/entrypoint.sh"]
