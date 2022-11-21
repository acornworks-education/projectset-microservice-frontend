FROM nginx:1.23.2-alpine

WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY build .

RUN apk add --update nodejs
RUN apk add --update npm
RUN npm install -g runtime-env-cra@0.2.2
RUN echo "REACT_APP_ENDPOINT=http://localhost:65080" > .env

CMD ["/bin/sh", "-c", "runtime-env-cra && nginx -g \"daemon off;\""]
