#!/bin/sh

if [ -n "$UPDATE_CA_CERTIFICATES" -a ! -f .update-ca-certificates.done ]; then
update-ca-trust && touch .update-ca-certificates.done
fi

exec /opt/louketo/louketo-proxy "$@"
