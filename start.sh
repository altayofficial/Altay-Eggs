#!/bin/bash
# Launches Altay under Pterodactyl.
#
# The server ships its own PHP build, because it needs extensions and a
# threading model a distribution PHP does not have. That binary is installed
# next to the phar, so it is preferred over anything on PATH.

cd /home/container || exit 1

if [ -x ./bin/php7/bin/php ]; then
	export PHPRC=""
	PHP_BINARY="./bin/php7/bin/php"
elif command -v php > /dev/null 2>&1; then
	echo "Warning: using the system PHP. Altay expects its own build and may refuse to start."
	PHP_BINARY="$(command -v php)"
else
	echo "No PHP binary found. Reinstall the server to fetch one."
	exit 1
fi

if [ ! -f ./Altay.phar ]; then
	echo "Altay.phar is missing. Reinstall the server."
	exit 1
fi

exec "$PHP_BINARY" ./Altay.phar --no-wizard --disable-ansi
