ARG GOVERSION=1.15

FROM golang:$GOVERSION

# Set UTC timezone
RUN ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime

RUN apt-get update && \
    apt-get install -y \
        build-essential \
        ca-certificates \
        mingw-w64


ENV CC="x86_64-w64-mingw32-gcc"
ENV CXX="x86_64-w64-mingw32-g++"
ENV GOARCH="amd64"
ENV GOOS="windows"
ENV CGO_ENABLED="1"

RUN mkdir -p /.cache/go-build
RUN chown 1000:1000 -R /.cache
USER 1000:1000

WORKDIR /go/package/app

#ENTRYPOINT ["go", "build", "-buildmode=c-shared", "-o=libicechat.dll", "./cmd/shared/main.go"]
ENTRYPOINT ["go", "build"]