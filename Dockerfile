FROM debian:12.2 as build

RUN apt-get update -y \
    && apt-get install --no-install-recommends -y tio \
    && rm -rf /var/lib/apt/lists/*

FROM gcr.io/distroless/base-debian12

COPY --from=build /lib/*/libinih.so.1 /lib/
COPY --from=build /usr/bin/tio /usr/bin

ENTRYPOINT ["/usr/bin/tio"]
