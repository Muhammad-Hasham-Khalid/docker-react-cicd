FROM node:14-alpine as build-stage

WORKDIR /app

# installing deps
COPY package.json .
RUN npm install

# generating build
COPY . .
RUN npm run build

# production server setup
FROM nginx

COPY --from=build-stage /app/build /usr/share/nginx/html 