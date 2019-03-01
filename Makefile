PKG_NAME := status_codes

default: build

.PHONY: build
build: install
	@echo "----> Building..."
	CGO_ENABLED=0 go build -o ./bin/$(PKG_NAME) -ldflags "-w -s" ./cmd/serve

.PHONY: clean
clean:
	@echo "----> Cleaning..."
	rm -rf ./bin ./vendor

.PHONY: install
install:
	@echo "----> Installing dependencies..."
	dep ensure

.PHONY: lint
lint:
	@echo "----> Running linter..."
	golangci-lint run ./...

.PHONY: setup
setup:
	@echo "----> Setting up tools..."
	go get -u -v github.com/codegangsta/gin github.com/golang/dep/cmd/dep github.com/golangci/golangci-lint/...
