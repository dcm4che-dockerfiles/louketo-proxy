FROM quay.io/louketo/louketo-proxy:1.0.0

COPY docker-entrypoint.sh /
COPY certs /etc/certs

ENTRYPOINT ["/docker-entrypoint.sh"]
