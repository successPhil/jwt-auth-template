FROM node:lts-alpine as builder  

WORKDIR /jwt-template
  

ARG NEXT_PUBLIC_BASE_URL=127.0.0.1

ENV NEXT_PUBLIC_BASE_URL=$NEXT_PUBLIC_BASE_URL  

COPY ./jwt-template/package*.json ./

RUN npm ci

COPY ./jwt-template .

RUN npm run build

RUN npm install -g next
EXPOSE 3000





FROM nginx:alpine



COPY ./webserver/default.conf /etc/nginx/conf.d/default.conf

COPY ./webserver/nginx.conf /etc/nginx

COPY --from=builder /jwt-template/.next /usr/share/nginx/html








