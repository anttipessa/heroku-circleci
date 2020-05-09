  
FROM alpine

WORKDIR /usr/app

COPY . .

RUN apk add --no-cache git nodejs nodejs-npm && \
    npm install && \
    npm install -g serve && \
    npm run build

USER app

CMD npm start