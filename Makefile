.DEFAULT_GOAL := build

init:
	git submodule update --init --recursive

docker:
	docker build -t "HPC-Scheduler" .

docker-run:
	docker run -d --restart always -p 127.0.0.1:8080:8080 "HPC-Scheduler"

build:
	bash build.sh

build-debug:
	go build -v -gcflags="all=-N -l" -o out/serv cmd/serv/main.go

run:
	./build/serv

clean:
	rm -rf out

.PHONY: init docker docker-run build build-debug run
