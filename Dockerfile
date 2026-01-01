FROM busybox AS check
ARG ALLOWED_ORIGIN_REGEX
ARG POSTHOG_API_HOST
ARG POSTHOG_ASSETS_HOST
WORKDIR /app
COPY checks.sh .
RUN ./checks.sh && touch .checked

FROM caddy:latest AS deploy
COPY --from=check /app/.checked /dev/null
WORKDIR /app
COPY Caddyfile /app/Caddyfile
CMD ["caddy", "run", "--config", "Caddyfile", "--adapter", "caddyfile"]