hg clone http://hg.nginx.org/nginx

wget https://www.openssl.org/source/openssl-1.1.1m.tar.gz
wget http://zlib.net/zlib-1.3.1.tar.gz
wget https://udomain.dl.sourceforge.net/project/pcre/pcre/8.45/pcre-8.45.tar.gz

mkdir objs
mkdir objs/lib
cd objs/lib

tar -xzf ../../pcre-8.44.tar.gz
tar -xzf ../../zlib-1.3.1.tar.gz
tar -xzf ../../openssl-1.1.1l.tar.gz

cd ../../

auto/configure \
--with-cc=cl \
--with-debug \
--prefix= \
--conf-path=conf/nginx.conf \
--pid-path=logs/nginx.pid \
--http-log-path=logs/access.log \
--error-log-path=logs/error.log \
--sbin-path=nginx.exe \
--http-client-body-temp-path=temp/client_body_temp \
--http-proxy-temp-path=temp/proxy_temp \
--http-fastcgi-temp-path=temp/fastcgi_temp \
--http-scgi-temp-path=temp/scgi_temp \
--http-uwsgi-temp-path=temp/uwsgi_temp \
--with-cc-opt=-DFD_SETSIZE=1024 \
--with-pcre=objs/lib/pcre-8.45 \
--with-zlib=objs/lib/zlib-1.2.11 \
--with-openssl=objs/lib/openssl-1.1.1m \
--with-openssl-opt=no-asm \
--with-http_ssl_module \
--with-http_gzip_static_module 
