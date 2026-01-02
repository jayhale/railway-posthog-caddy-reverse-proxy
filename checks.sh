#!/bin/sh
set -e

warn() {
    echo "WARNING: $1" >&2
}

# Check POSTHOG_ASSETS_HOST
if [ "$POSTHOG_ASSETS_HOST" != "us-assets.i.posthog.com" ] \
   && [ "$POSTHOG_ASSETS_HOST" != "eu-assets.i.posthog.com" ]; then
    warn "POSTHOG_ASSETS_HOST is set to '$POSTHOG_ASSETS_HOST'. Expected 'us-assets.i.posthog.com' or 'eu-assets.i.posthog.com'."
fi

# Check POSTHOG_API_HOST
if [ "$POSTHOG_API_HOST" != "us.i.posthog.com" ] \
   && [ "$POSTHOG_API_HOST" != "eu.i.posthog.com" ]; then
    warn "POSTHOG_API_HOST is set to '$POSTHOG_API_HOST'. Expected 'us.i.posthog.com' or 'eu.i.posthog.com'."
fi

# Check ALLOWED_ORIGIN_REGEX
if [ -n "$ALLOWED_ORIGIN_REGEX" ]; then
    case "$ALLOWED_ORIGIN_REGEX" in
        *\$) ;;
        *) warn "ALLOWED_ORIGIN_REGEX is set but does not end with '$'. This could be a security risk." ;;
    esac
fi
