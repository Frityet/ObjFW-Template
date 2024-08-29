FROM alpine:latest

# First, we need xmake
RUN apk add git build-base clang
RUN apk add xmake

WORKDIR /app
COPY . .

RUN xmake config --mode=debug --toolchain=clang --kind=static

CMD xmake
