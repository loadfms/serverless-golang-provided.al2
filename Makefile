.PHONY: build clean deploy test serverless-deploy npmci

GO_BUILD := env GOARCH=arm64 GOOS=linux go build -ldflags="-s -w"

build:
	export GO111MODULE=on
	export CGO_ENABLED=1

	${GO_BUILD} -o bin/hello/bootstrap hello/main.go
	chmod +x bin/hello/bootstrap
	zip -j bin/hello/hello.zip bin/hello/bootstrap 

	${GO_BUILD} -o bin/world/bootstrap world/main.go
	chmod +x bin/world/bootstrap
	zip -j bin/world/world.zip bin/world/bootstrap 

clean:
	rm -rf ./bin

deploy: clean build
	sls deploy --verbose
