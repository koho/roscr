FROM golang:latest

RUN go get github.com/koho/udpp

RUN go build -trimpath -ldflags "-s -w" -o /udpp github.com/koho/udpp/cmd/udpp

FROM alpine:latest

COPY --from=0 /udpp /udpp

CMD ["/udpp"]
