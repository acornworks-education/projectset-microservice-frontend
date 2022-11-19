FROM nginx:1.23.2

WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY build .
