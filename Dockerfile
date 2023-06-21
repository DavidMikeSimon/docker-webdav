FROM debian:10.6-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
                    nginx \
                    nginx-extras && \
    rm -rf /var/lib/apt/lists

EXPOSE 80

CMD nginx -g "daemon off;"
