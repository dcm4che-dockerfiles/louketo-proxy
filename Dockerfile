FROM alpine:3.12.0

ENV NAME louketo-proxy
ENV LOUKETO_PROXY_VERSION 1.0.0
ENV GOOS linux
ENV GOARCH amd64

LABEL Name=louketo-proxy \
      Release=https://github.com/louketo/louketo-proxy/releases \
      Url=https://github.com/louketo/louketo-proxy \
      Help=https://github.com/louketo/louketo-proxy/blob/master/docs/user-guide.md

RUN adduser -h /opt/louketo -D -u 1001 louketo

RUN apk add --no-cache libc6-compat ca-certificates su-exec curl tar

WORKDIR "/opt/louketo"

RUN curl -fssL "https://github.com/louketo/louketo-proxy/releases/download/$LOUKETO_PROXY_VERSION/${NAME}_${LOUKETO_PROXY_VERSION}_${GOOS}_${GOARCH}.tar.gz" | tar -xz --strip-components=1

RUN apk del curl tar

COPY docker-entrypoint.sh /
COPY certs /etc/certs
COPY templates ./templates

RUN chown -R louketo:louketo /opt/louketo

ENTRYPOINT ["/docker-entrypoint.sh"]
