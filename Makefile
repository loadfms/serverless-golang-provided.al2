.PHONY: build clean deploy test serverless-deploy npmci

GO_BUILD := env GOARCH=arm64 GOOS=linux go build -ldflags="-s -w"

build:
	export GO111MODULE=on
	export CGO_ENABLED=1

	${GO_BUILD} -o bin/hello/main hello/main.go
	chmod +x bin/hello/main
	mv bin/hello/main bin/hello/bootstrap
	cd bin/hello && zip bootstrap.zip bootstrap 

	${GO_BUILD} -o bin/world/main world/main.go
	chmod +x bin/world/main
	mv bin/world/main bin/world/bootstrap
	cd bin/world && zip bootstrap.zip bootstrap

clean:
	rm -rf ./bin

deploy: clean build
	sls deploy --verbose
