# FROM golang:alpine

# WORKDIR /go/src

# COPY ./src .

# RUN GOOS=linux go build -o /go/bin/sum -ldflags="-s -w" sum/sum.go

# ENTRYPOINT ["/go/bin/sum"]

FROM golang

COPY ./src/sum/sum ./

ENTRYPOINT ["./sum"]