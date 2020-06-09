FROM golang:alpine AS builder

RUN apk add upx

WORKDIR /build

COPY . .

RUN go build -o sum -a -ldflags="-s -w" -installsuffix cgo && \
    upx --ultra-brute -qq sum && \
    upx -t sum

WORKDIR /bin
RUN cp /build/sum ./sum

FROM scratch

COPY --from=builder /bin .

ENTRYPOINT ["./sum"]