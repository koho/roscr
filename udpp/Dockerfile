FROM golang:latest

RUN git clone https://github.com/koho/udpp.git

RUN cd udpp && go build -trimpath -ldflags "-s -w" -o /udpp github.com/koho/udpp/cmd/udpp

FROM alpine:latest

COPY --from=0 /udpp /udpp

CMD ["/udpp"]
