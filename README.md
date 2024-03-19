# Golang mod provided.al2 Serverless template

## Requirements

- Serverless CLI
- Make

## Instructions

To create a new serverless project using this template run the command:
```console
serverless --template-url "https://github.com/loadfms/serverless-golang-provided.al2"
```

Don't forget to initialize the go mod package and install the `aws-lambda-go`
package:

```console
go mod init <package-name>
go get github.com/aws/aws-lambda-go
```

To make deploy just run the command:
```console
make deploy
```
