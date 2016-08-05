#!/bin/bash

mods=""
#mods="$mods --with-threads"
mods="$mods --with-file-aio"
mods="$mods --with-ipv6"
mods="$mods --with-http_ssl_module"
mods="$mods --with-http_v2_module"
#mods="$mods --with-http_spdy_module"
mods="$mods --with-http_realip_module"
mods="$mods --with-http_addition_module"
mods="$mods --with-http_xslt_module"
mods="$mods --with-http_image_filter_module"
mods="$mods --with-http_geoip_module"
mods="$mods --with-http_sub_module"
mods="$mods --with-http_dav_module"
mods="$mods --with-http_gunzip_module"
mods="$mods --with-http_gzip_static_module"
mods="$mods --with-http_auth_request_module"
mods="$mods --with-http_stub_status_module "
mods="$mods --with-mail --with-mail_ssl_module"
mods="$mods --with-stream --with-stream_ssl_module"
mods="$mods --with-pcre-jit "
#mods="$mods --with-http_flv_module --with-http_mp4_module"

mods2=""
# https://bitbucket.org/nginx-goodies/nginx-sticky-module-ng.git
mods2="$mods2 --add-module=nginx-sticky-module-ng"
# https://github.com/arut/nginx-rtmp-module
#mods2="$mods2 --add-module=nginx-rtmp-module"
# https://github.com/openresty/lua-nginx-module
#mods2="$mods2 --add-module=lua-nginx-module-0.10.5" # depends liblua5.1-0-dev


opts=""
opts="$opts --prefix=/usr --conf-path=/etc/nginx/nginx.conf --http-log-path=/var/log/nginx/access.log --error-log-path=/var/log/nginx/error.log --lock-path=/var/run/nginx.lock --pid-path=/var/run/nginx.pid"
opts="$opts --http-client-body-temp-path=/var/lib/nginx/body --http-fastcgi-temp-path=/var/lib/nginx/fastcgi --http-proxy-temp-path=/var/lib/nginx/proxy --http-scgi-temp-path=/var/lib/nginx/scgi --http-uwsgi-temp-path=/var/lib/nginx/uwsgi"

cc_opt="-g -O2 -fPIE -fstack-protector -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2"
ld_opt="-Wl,-Bsymbolic-functions -fPIE -pie -Wl,-z,relro -Wl,-z,now"

./configure --with-cc-opt="$cc_opt" --with-ld-opt="$ld_opt" $opts $mods $mods2

