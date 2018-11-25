FROM python:3.6-alpine

ENV LIBRARY_PATH=/lib:/usr/lib \
    USER_NAME='' \
    USER_PASSWORD=''

WORKDIR /app

RUN apk add --no-cache libjpeg-turbo git build-base jpeg-dev zlib-dev freetype-dev libpng-dev && \
    pip install --upgrade pip wheel setuptools && \
    git clone https://github.com/yjqiang/bilibili-live-tools.git /app && \
    pip install --no-cache-dir -r requirements.txt && \
    rm -r /var/cache/apk && \
    rm -r /usr/share/man

VOLUME ["/app/conf"]

ENTRYPOINT python ./run.py
