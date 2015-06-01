all: build

build:
	docker build -t convox/registry .

run: build
	docker run -e PASSWORD=test -it -p 8000:443 convox/registry
