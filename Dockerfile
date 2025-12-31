FROM caddy:latest AS deploy

ARG POSTHOG_API_HOST=us.i.posthog.com
ARG POSTHOG_ASSETS_HOST=us-assets.i.posthog.com

WORKDIR /app
COPY Caddyfile /app/Caddyfile
RUN caddy fmt --overwrite && cat Caddyfile

CMD ["caddy", "run", "--config", "Caddyfile", "--adapter", "caddyfile"]