FROM node:14

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD [ "npm", "start" ]

FROM mongo:latest

COPY db.json /db.json

CMD mongoimport --host mongodb --db redbicicletas --collection bicicletas --type json --file /db.json --jsonArray