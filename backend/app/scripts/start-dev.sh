#!/usr/bin/env bash

set -e

# Start Uvicorn with live reload
exec uvicorn --reload --proxy-headers --log-level $LOG_LEVEL --host 0.0.0.0 --port 8000 src.main:app
