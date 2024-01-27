# syntax=docker/dockerfile:1
FROM ubuntu:22.04 AS builder
COPY build /build
WORKDIR /build
RUN /bin/bash /build/main.sh
FROM scratch
# FROM alpine
COPY apply /
COPY --from=builder /build/pkg/* /pkg/
COPY --from=builder /build/bin/* /