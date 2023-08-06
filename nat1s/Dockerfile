FROM golang:latest

RUN git clone https://github.com/koho/nat1s.git

RUN cd nat1s && GO111MODULE=on CGO_ENABLED=0 go build -trimpath -ldflags "-s -w" -o /nat1s github.com/koho/nat1s/cmd/nat1s

FROM alpine:latest

COPY --from=0 /nat1s /nat1s

ENTRYPOINT ["/nat1s"]
