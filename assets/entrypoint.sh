#!/bin/bash

export APP_ID=${APP_ID:-000001}
export OPTIONAL_VAR=${OPTIONAL_VAR:-}
export OBLIGATORY_VAR=${OBLIGATORY_VAR}

# Verify obligatory variables
if [ -z "${OBLIGATORY_VAR}" ]; then echo "OBLIGATORY_VAR variable is not provided, exiting..."; exit -1; fi

echo "Generating app.properties..."
envsubst < /templates/app.properties > /app.properties
cat /app.properties
