#!/bin/bash
: "${TOPDOMAIN:=iodine.lab}"
: "${PASSWORD:=secretpassword}"

case "$ROLE" in
  server)
    : "${TUNNEL_IP:=172.16.53.1}"
    exec iodined -f -c -P "$PASSWORD" "$TUNNEL_IP" "$TOPDOMAIN"
    ;;
  client)
    : "${SERVER_IP:?SERVER_IP must be set when ROLE=client}"
    exec iodine -f -r -P "$PASSWORD" "$SERVER_IP" "$TOPDOMAIN" # -r forces DNS-mode
    ;;
  *)
    echo "ROLE must be 'server' or 'client' (got '$ROLE')" >&2
    exit 1
    ;;
esac
