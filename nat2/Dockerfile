FROM rust:latest

RUN git clone https://github.com/koho/nat2.git

RUN cd nat2 && cargo build --release

FROM debian:bookworm

COPY --from=0 /nat2/target/release/nat2 /nat2

ENTRYPOINT ["/nat2"]
