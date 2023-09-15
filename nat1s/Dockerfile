FROM golang:latest

RUN git clone https://github.com/koho/nat1.git

RUN cd nat1 && GO111MODULE=on CGO_ENABLED=0 go build -trimpath -ldflags "-s -w" -o /nat1s github.com/koho/nat1/cmd/nat1s

FROM alpine:latest

COPY --from=0 /nat1s /nat1s

ENTRYPOINT ["/nat1s"]
