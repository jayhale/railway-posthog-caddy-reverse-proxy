# A Caddy Reverse Proxy for PostHog, on Railway

PostHog works best with a [reverse proxy](https://posthog.com/docs/advanced/proxy/caddy).
This template gives you a fully-configured Caddy proxy for PostHog in 20 seconds or less (probably).

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/xxKDnH?referralCode=fJi8gp)

## Configuration

### Set your domain

Out of the box, you'll get a Railway subdomain.
You'll likely want to change this to your own domain.
See the Railway docs for how to [change your domain](https://docs.railway.com/guides/public-networking#custom-domains).

### Set PostHog hosts (EU users only)

For EU users, you'll also need to update two variables, `POSTHOG_API_HOST` and `POSTHOG_ASSETS_HOST`, to point to PostHog's EU endpoints.

```sh
POSTHOG_API_HOST="eu.i.posthog.com"
POSTHOG_ASSETS_HOST="eu-assets.i.posthog.com"
```

### Set allowed origins for the PostHog toolbar (optional)

To allow your browser to load the PostHog toolbar on your side, set the `ALLOWED_ORIGIN_REGEX` variable.
This configures the proxy to add `Access-Control-Allow-Origin` headers to responses that come from origins matching your regex.
```sh
# Match exactly one domain
ALLOWED_ORIGIN_REGEX="^https?:\/\/my-domain\.com$"

# Match only subdomains
ALLOWED_ORIGIN_REGEX="^https?:\/\/.*\.my-domain\.com$"

# Match subdomains and the root domain
ALLOWED_ORIGIN_REGEX="^https?:\/\/.*my-domain\.com$"
```

You should **always** terminate this regex with a `$` to avoid matching potentially malicious origins (such as `https://my-domain.com.evil.com`):

```shell
# Never do this!
ALLOWED_ORIGIN_REGEX="^https?:\/\/.*my-domain\.com"
#                              Missing `$` -------^
```

## Why

There is an [official PostHog proxy template](https://github.com/PostHog/posthog-nginx-reverse-proxy), but it uses nginx. 
Which I failed to get working.
And I ran out of patience troubleshooting.
So voilà, here we are.

## Related projects & attribution

- [PostHog](https://github.com/PostHog/posthog)
- [Caddy](https://github.com/caddyserver/caddy)
- [Railway](https://railway.app)
- [The official nginx Railway template](https://github.com/PostHog/posthog-nginx-reverse-proxy)
