echo "http://dl-4.alpinelinux.org/alpine/v3.9/main" >> /etc/apk/repositories && \
echo "http://dl-4.alpinelinux.org/alpine/v3.9/community" >> /etc/apk/repositories

apk update && \
	apk add build-base \
    libxml2-dev \
    libxslt-dev \
    postgresql-dev \
    && rm -rf /var/cache/apk/*