#!/usr/bin/env bash

set -Eeuo pipefail

RESET=$'\e[0m'
GREEN=$'\e[32m'
YELLOW=$'\e[33m'
MAGENTA=$'\e[35m'
CYAN=$'\e[36m'

echo "${GREEN}Started setup script...${RESET}"

if ! wp core is-installed; then
	echo "${CYAN}WordPress is not installed. Setting up WordPress...${RESET}"
	wp core install --url="http://localhost:7000" \
		--title="My Site" \
		--admin_user=admin \
		--admin_password=admin \
		--admin_email=admin@example.com
	wp plugin uninstall --all
	wp theme uninstall --all
fi

echo "${MAGENTA}Core version: 	$(wp core version)${RESET}"
echo "${MAGENTA}Site name:	$(wp option get blogname)${RESET}"
echo "${MAGENTA}Site URL:	$(wp option get siteurl)${RESET}"
echo "${MAGENTA}Plugin path: 	$(wp plugin path)${RESET}"
