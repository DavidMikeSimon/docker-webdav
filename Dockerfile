FROM debian:10.6-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
                    nginx \
                    nginx-extras \
                    rm -rf /var/lib/apt/lists

RUN usermod -u $UID www-data && groupmod -g $GID www-data

EXPOSE 80

COPY entrypoint.sh /
RUN chmod +x entrypoint.sh

CMD /entrypoint.sh && nginx -g "daemon off;"
