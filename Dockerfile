FROM node:16-alpine

COPY . /app
WORKDIR /app

RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk add alpine-sdk

RUN PYTHONUNBUFFERED=1 && \
    apk add --update --no-cache python3 && \
    ln -sf python3 /usr/bin/python && \
    python3 -m ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools

CMD [ "yarn", "build" ]
