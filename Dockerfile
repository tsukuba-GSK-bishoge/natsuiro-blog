FROM ghcr.io/getzola/zola:v0.20.0 as builder

LABEL version="0.0.1"
LABEL descripttion="jsys travel blog"
LABEL maintainer="sohosai"

COPY . /project
WORKDIR /project
RUN ["zola", "build"]

FROM nginx:alpine
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /project/public /usr/share/nginx/html
EXPOSE 80
