all: build

build:
	docker build -t convox/registry .

run: build
	docker run -e PASSWORD=test -it -p 8000:443 convox/registry

publish:
	docker tag -f convox/registry:$(VERSION) convox/registry:latest
	docker push convox/registry:latest

release:
	docker build -t convox/registry:$(VERSION) .
	docker push convox/registry:$(VERSION)
