#!/usr/bin/bash
docker stop py-kms
docker rm py-kms
docker image rm pykmsorg/py-kms:python3
docker pull --platform linux/amd64 pykmsorg/py-kms:python3
docker run -it -d --name py-kms \
    -p 8080:8080 \
    -p 1688:1688 \
    -e IP=0.0.0.0 \
    -e PORT=1688 \
    -e LOGSIZE=2 \
    -e LOGFILE=/var/log/py3-kms.log \
    -v /var/log:/var/log:rw \
    -v /home/py-kms:/home/py-kms/db:rw \
    --restart unless-stopped \
    pykmsorg/py-kms:python3
