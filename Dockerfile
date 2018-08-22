#
# HTTPbin over HTTP/2 Dockerfile
#
FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN \
  apt-get update && apt-get install --no-install-recommends build-essential python3-dev python3-pip python3-setuptools nghttp2 -y && \ 
  pip3 install -U --upgrade pip==9.0.3 && \
  pip3 install gunicorn httpbin && \
  echo 'frontend=0.0.0.0,8000;no-tls' > nghttp2-proxy.conf && \
  echo 'backend=127.0.0.1,8001' >> nghttp2-proxy.conf && \
  echo '#!/bin/bash' > run.sh && \
  echo 'exec gunicorn --bind=127.0.0.1:8001 httpbin:app &' >> run.sh && \
  echo 'exec nghttpx --conf=nghttp2-proxy.conf' >> run.sh && \
  chmod +x run.sh && \
  apt-get remove --purge build-essential python3-dev -y && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/*
  
EXPOSE 8000
  
CMD ["./run.sh"]
