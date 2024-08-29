FROM alpine:latest

# First, we need xmake
RUN apk add git build-base clang 7zip curl
RUN apk add xmake

WORKDIR /app
COPY . .

ENV XMAKE_ROOT=y
RUN curl -fsSL https://xmake.io/shget.text | bash
RUN echo "source ~/.xmake/profile" >> ~/.bashrc
RUN echo 'alias xmake="/root/.local/bin/xmake"' >> /root/.bashrc

RUN xmake config -v -y --mode=debug --kind=shared

CMD xmake
