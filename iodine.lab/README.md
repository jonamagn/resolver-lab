# iodine DNS tunneling

In order to analyze the traffic of DNS tunneling tools, we build a docker image for iodine.
The same image is used for both the client and the server, albeit with different entrypoints
in boot.sh. For best performance it is recommended to turn off query name minimization on the
resolver specified by the iodine client. We analyze the traffic in wireshark by having a capture
filter on the IP address of the resolver. We perform a ping test and a http test:

```sh
# verify tunnels on client
docker exec iodine-client ip addr show dns0
docker exec iodine-client ip route

# ping test
docker exec iodine-client ping -c 4 172.16.53.1

# http test
docker exec -d iodine-server python3 -m http.server 8000 --bind 172.16.53.1
docker exec iodine-client curl http://172.16.53.1:8000
```

