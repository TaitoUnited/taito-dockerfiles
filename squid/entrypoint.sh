#!/bin/sh

set -e

SQUID=$(/usr/bin/which squid)

echo "${SITES_WHITELIST}" | tr ' ' '\n' > /run/sites.whitelist.txt
echo "Whitelist:"
cat /run/sites.whitelist.txt

# Launch squid
echo "Starting Squid..."
tail -vn 0 -F /var/log/squid/access.log /var/log/squid/cache.log &
exec "$SQUID" -NYCd 1
