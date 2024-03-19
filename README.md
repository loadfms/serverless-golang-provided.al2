# Golang mod provided.al2 Serverless template

## Requirements

- Serverless CLI
- Make

## Instructions

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
