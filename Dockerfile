FROM node:18.20.4-alpine AS build

WORKDIR /jenkinsdocker

COPY . .

RUN npm install

RUN npm run build

FROM nginx:1.18.0-alpine

COPY --from=build /jenkinsdocker/dist/jenkinsdocker /usr/share/nginx/html

EXPOSE 80