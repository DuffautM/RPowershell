#!/bin/bash

cat <<EOC > /etc/bind/$1.exia.tl

\$TTL 604800
@	IN	SOA	dnse.$1.exia.tl. $1.exia.tl(
			1
			604800
			86400
			2419200
			604800)
@	IN	NS	dnse.$1.exia.tl

dnse	IN	A	192.168.0.0

EOC

cat<<EOF2 >> /etc/bind/named.conf.local

zone $1.fr" IN {
	type master;
	file "/etc/bind/$1.exia.tl";
};

EOF2

cat<<EOF3
