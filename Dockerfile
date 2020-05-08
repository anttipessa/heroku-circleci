
FROM node:10

WORKDIR /usr/src/app
 
COPY package*.json ./
RUN npm install
RUN npm build
RUN npm install -g serve 

COPY . .

EXPOSE $PORT

CMD [ "serve", "-s" "build" ]


