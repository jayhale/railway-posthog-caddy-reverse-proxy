FROM caddy:latest AS deploy

WORKDIR /app
COPY Caddyfile /app/Caddyfile
RUN caddy fmt --overwrite

CMD ["caddy", "run", "--config", "Caddyfile", "--adapter", "caddyfile"]