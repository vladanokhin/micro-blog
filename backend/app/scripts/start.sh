#!/bin/bash

set -e

if [ "$APP_ENV" == "dev" ]; 
then
    exec ./scripts/start-dev.sh
else
    exec ./scripts/start-prod.sh
fi
