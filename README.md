# Docker image to cross-compile golang application

The image intended to simplify cross-compilation of golang applications that depends on cgo.

## Note

By default, during the build process, container uses a user with 1000:1000 (uid:gid)

## Usage

### Build docker image

__Build arguments:__
* GOVERSION - go version (default - 1.15)

```bash
docker build --build-arg GOVERSION=1.15 -t go-crosscompile .
```

### Build golang application

```bash
cd <your_project_dir>
docker run -it --rm -v $PWD:/go/package/app go-crosscompile -o=out.exe ./cmd/main.go
```

Build DLL:
```bash
cd <your_project_dir>
docker run -it --rm -v $PWD:/go/package/app go-crosscompile -buildmode=c-shared -o=out.dll ./cmd/main.go
```

#
