FROM caddy:latest AS deploy
WORKDIR /app
COPY . /app
CMD ["./start.sh"]