docker-httpbin-over-http2
=============

Dockerfile for serving httpbin over HTTP/2

What is httpbin?
================

[httpbin](http://httpbin.org/): HTTP Request & Response Service


How is it served over HTTP/2
================

[nghttp2](https://github.com/nghttp2/nghttp2) project is used to start a HTTP/2 proxy server which serves HTTP/2 as well as HTTP/1 on the frontend and connects to the original httpbin server over HTTP/1 on the backend 

Is there a Dockerfile that serves httpbin over HTTP/1
================

Yes: https://github.com/citizen-stig/dockerhttpbin


What port is exposed?
================
Port 8000


How to use it?
================
1. ```docker pull skydoctor/httpbin-http2```
2. ```docker run -d -p 8000 skydoctor/httpbin-http2```
3. Go to the exposed port in docker for this machine.


SEE ALSO
--------
https://nghttp2.org/documentation/nghttpx-howto.html
