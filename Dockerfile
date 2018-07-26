FROM python:3.6-alpine

MAINTAINER zsnmwy <szlszl35622@gmail.com>

ENV LIBRARY_PATH=/lib:/usr/lib \
    USER_NAME='' \
    USER_PASSWORD=''

WORKDIR /app

RUN apk add --no-cache --virtual bili git build-base python-dev py-pip jpeg-dev zlib-dev && \
    git clone https://github.com/yjqiang/bilibili-live-tools.git /app && \
    pip install --no-cache-dir -r requirements.txt && \
    rm -r /var/cache/apk && \
    rm -r /usr/share/man && \
    apk del bili && \
    apk add --no-cache libjpeg-turbo

ENTRYPOINT sed -i ''"$(cat conf/bilibili.toml -n | grep "username =" | awk '{print $1}')"'c '"$(echo "username = \"${USER_NAME}\"")"'' conf/bilibili.toml && \
            sed -i ''"$(cat conf/bilibili.toml -n | grep "password =" | awk '{print $1}')"'c '"$(echo "password = \"${USER_PASSWORD}\"")"'' conf/bilibili.toml && \
            python ./run.py
