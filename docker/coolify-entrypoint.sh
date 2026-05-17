#!/usr/bin/env bash
set -e

if [ -d /home/frappe/frappe-bench/assets ]; then
	mkdir -p /home/frappe/frappe-bench/sites/assets
	cp -r /home/frappe/frappe-bench/assets/. /home/frappe/frappe-bench/sites/assets/
fi

exec "$@"
