This image uses WINE to run [GRC DNS Benchmark](https://www.grc.com/dns/benchmark.htm). The application can be accessed through a browser at [https://localhost:5800](https://localhost:5800).

[Dockerhub](https://hub.docker.com/repository/docker/mattisz/gibson-dns)

Docker Run:
```
docker run -d -p 5800:5800 -v /var/lib/docker/data/gibson-dns/config:/config -e "USER_ID=0" -e "GROUP_ID=0" -e "TZ=UTC" -e "DISPLAY_WIDTH=604" -e "DISPLAY_HEIGHT=472" -e "SECURE_CONNECTION=1" --init mattisz/gibson-dns:latest
```

Docker Compose (with prebuilt image from Docker Hub):
```
---
version: "2.1"
services:
  app:
    image: mattisz/gibson-dns:latest
    init: true
    environment:
      - USER_ID=0
      - GROUP_ID=0
      - TZ=UTC
      - DISPLAY_WIDTH=604
      - DISPLAY_HEIGHT=472
      - SECURE_CONNECTION=1
    ports:
      - 5800:5800
    volumes:
      - /var/lib/docker/data/gibson-dns/config:/config
    restart: unless-stopped
```

DISCLAIMER:

I am not the creator of GRC DNS Benchmark but I am also not distributing it. The executable is downloaded on first launch of the container. If GRC takes issue with this, please contact me via GH issue.

Credits:

[GRC DNS Benchmark](https://www.grc.com/dns/benchmark.htm)

[jlesage/docker-baseimage-gui](https://github.com/jlesage/docker-baseimage-gui)
