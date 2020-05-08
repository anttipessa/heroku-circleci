  
FROM alpine

WORKDIR /usr/app

COPY . .

RUN apk add --no-cache git nodejs nodejs-npm && \
    npm install && \
    npm install -g serve && \
    npm run build && \
    apk del git && \
    addgroup app && \
    adduser -D -G app app && \
    chown -R app:app /usr/app

USER app

CMD serve -s -l $PORT dist