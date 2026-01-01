FROM busybox AS check
WORKDIR /app
COPY checks.sh .
RUN ./checks.sh

FROM caddy:latest AS deploy
WORKDIR /app
COPY Caddyfile /app/Caddyfile
CMD ["caddy", "run", "--config", "Caddyfile", "--adapter", "caddyfile"]