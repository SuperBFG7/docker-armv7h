#!/bin/bash

. /initialize.sh

/usr/bin/mysqld_safe --datadir='/var/lib/mysql' &

. /mysql_secure.sh

/usr/bin/nginx -g 'pid /run/nginx.pid; error_log stderr;' &
/usr/bin/php-fpm --nodaemonize --fpm-config /etc/php/php-fpm.conf 
