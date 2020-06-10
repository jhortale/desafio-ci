FROM golang

COPY ./src/sum/sum ./

ENTRYPOINT ["./sum"]