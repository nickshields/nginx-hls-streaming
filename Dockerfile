FROM ubuntu:18.04

RUN apt-get -y update; \
	apt-get -y upgrade; \
	apt-get install -y build-essential libpcre3 libpcre3-dev libssl-dev curl git wget zlib1g zlib1g-dev vim;

EXPOSE 8080
EXPOSE 80
EXPOSE 1935
EXPOSE 443

WORKDIR /home/

RUN git clone https://github.com/sergey-dryabzhinsky/nginx-rtmp-module; \
	wget http://nginx.org/download/nginx-1.17.3.tar.gz; \
	tar -xf nginx-1.17.3.tar.gz; \
	rm -rf nginx-1.17.3.tar.gz; \ 
	cd nginx-1.17.3/; \
	./configure --with-http_ssl_module --add-module=../nginx-rtmp-module;\
	make; \
	make install; \
	mv /usr/local/nginx/conf/nginx.conf /usr/local/nginx/conf/nginx.conf.original; \
	mkdir -p /nginx/hls

COPY nginx.conf /usr/local/nginx/conf/

CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]



