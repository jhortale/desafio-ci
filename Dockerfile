# FROM golang:alpine AS builder

# RUN apk add upx

# WORKDIR /go/src

# COPY sum.go .

# RUN go build -o sum -a -ldflags="-s -w" -installsuffix cgo && \
#     upx --ultra-brute -qq sum && \
#     upx -t sum
# RUN GOOS=linux go build -ldflags="-s -w" sum.go
# RUN ls
# ENTRYPOINT ["./sum"]
# WORKDIR /bin
# RUN cp /build/sum ./sum

# FROM scratch

# COPY --from=builder /go/src/app/sum .
# RUN pwd
# ENTRYPOINT ["/sum"]

FROM golang:alpine

WORKDIR /go/src

COPY ./src .

RUN GOOS=linux go build -o /go/bin/sum -ldflags="-s -w" sum/sum.go

ENTRYPOINT ["/go/bin/sum"]