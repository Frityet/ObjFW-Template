FROM alpine:latest

RUN apk add bash git gcc make readline-dev ncurses-dev libc-dev


# install xmake
RUN cd /tmp/ && git clone --depth=1 "https://github.com/tboox/xmake.git" --recursive xmake
RUN cd /tmp/xmake && ./scripts/get.sh __local__
RUN rm -rf /tmp/xmake

# install directories
WORKDIR /app
COPY . .

# deps needed for build of the project
RUN apk add 7zip wget perl clang linux-headers
ENV PATH=~/.local/bin:$PATH
ENV XMAKE_ROOT=y
RUN /root/.local/bin/xmake config -y --mode=debug --kind=static --toolchain=clang
RUN /root/.local/bin/xmake -v

CMD [ "/root/.local/bin/xmake", "run" ]

