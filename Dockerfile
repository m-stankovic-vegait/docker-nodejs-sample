
# Build stage
# FROM node:22-alpine3.20 AS build
FROM node:20 AS build

COPY ./package.json ./app/

WORKDIR /app

RUN npm install --loglevel verbose
# RUN npm install --force --loglevel verbose

COPY ./src ./src

# TODO: build?
# RUN npm run build

# Prod stage
FROM node:20-alpine3.20

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install --only=production --loglevel verbose

# COPY --from=build /app ./
COPY --from=build /app/src ./src

EXPOSE 3000

ENTRYPOINT ["node", "./src/index.js"]


# CMD ["node", "index.js"]