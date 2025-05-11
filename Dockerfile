

# FROM alpine:latest as dependencies
FROM node:13-alpine3.11 as dependencies

RUN apk add --no-cache \
    python2 make 

COPY package.json  .
RUN npm install 

# FROM alpine:latest
FROM node:13-alpine3.11
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.docker.cmd="docker run -d -p 3000:3000 --name alpine_timeoff"

RUN apk add --no-cache \
    # nodejs npm \
    vim

RUN adduser --system app --home /app
USER app
WORKDIR /app
COPY . /app
COPY --from=dependencies node_modules ./node_modules

CMD npm start

EXPOSE 3000

