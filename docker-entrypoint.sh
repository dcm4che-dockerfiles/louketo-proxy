#!/bin/sh

if [ -n "$UPDATE_CA_CERTIFICATES" -a ! -f .update-ca-certificates.done ]; then
update-ca-certificates && touch .update-ca-certificates.done
fi

su-exec louketo /opt/louketo/louketo-proxy "$@"
