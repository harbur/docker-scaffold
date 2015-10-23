#!/bin/bash

export APP_ID=${APP_ID:-000001}
export OPTIONAL_VAR=${OPTIONAL_VAR:-}
export VAR1=${VAR1}
export VAR2=${VAR2}

# Space separated list of Obligatory Variables
OBLIGATORY_VARS="VAR1 VAR2"
# Verify obligatory variables
for VAR in $OBLIGATORY_VARS; do
	if [ -z "${!VAR}" ]; then
		echo "$VAR variable is not provided, exiting..."
		exit -1
	fi
done

echo "Generating app.properties..."
envsubst < /templates/app.properties > /app.properties
cat /app.properties
