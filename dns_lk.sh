#!/bin/bash

function dns_lookup() {
	# Colours
	RED="\e[1;31m"
	GREEN="\e[1;92m"
	END="\e[0m"

	# Read DNS Server
	read -p $'\e[1;94m[*]\e[1;0m DNS Server: ' SERVER
	if [[ -n ${SERVER} ]]; then
		echo -e "${GREEN}[*]${END} The DNS Server is: ${SERVER}"
		# Read user_input
		read -p $'\e[1;94m[*]\e[1;0m Proceed? [y/n]: ' ANSWER
		# ${STRING,,} => ",," means lowercase
		if [[ "${ANSWER,,}" == "y" || "${ANSWER,,}" == "yes" ]]; then
			# Infinite loop to read IP
			while true; do
				read -p $'\e[1;94m[*]\e[1;0m IP: ' IP
				/usr/bin/nslookup -query=A ${IP} ${SERVER}
			done
		# Exit
		elif [[ ${ANSWER,,} == "n" || ${ANSWER,,} == "no" ]]; then
			echo "Exit ..."
			return 0
		# Wrong input
		else
			echo "Wrong input"
			return 1
		fi
	else
		return 0
	fi
}

dns_lookup
