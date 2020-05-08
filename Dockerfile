FROM ubuntu:16.04

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y curl \
  && curl -sL https://deb.nodesource.com/setup_12.x | bash \
  && apt-get install -y nodejs \
  && apt-get purge -y --auto-remove curl \
  && rm -rf /var/lib/apt/lists/* \
  && npm install

EXPOSE $PORT

CMD ["npm", "start" ]