#!/bin/sh
set -e

# Run checks (will warn on unexpected configuration)
./checks.sh

# Start the reverse proxy
caddy run --config Caddyfile --adapter caddyfile
