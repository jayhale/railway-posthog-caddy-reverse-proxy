# A Caddy Reverse Proxy for PostHog, on Railway

1-click deploy of a PostHog reverse proxy on Railway.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/xxKDnH?referralCode=fJi8gp)

## Configuration

You can configure the PostHog endpoints that you proxy with two variables:

- `POSTHOG_API_HOST`: the PostHog host for the events API.
  At the time of writing, this is either:
    - `us.i.posthog.com` (default) if you're in the US, or
    - `eu.i.posthog.com` if you're in Europe
- `POSTHOG_ASSETS_HOST`: the PostHog host for scripts / CSS.
   At the time of writing, this is either:
   - `us-assets.i.posthog.com` (default) if you're in the US, or
   - `eu-assets.i.posthog.com` if you're in Europe
