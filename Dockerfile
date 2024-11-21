FROM node:22

COPY ./package.json ./app/
COPY ./src ./app/

WORKDIR /app

# RUN npm install --loglevel verbose
RUN npm install --force --loglevel verbose

EXPOSE 3000

CMD ["node", "index.js"]