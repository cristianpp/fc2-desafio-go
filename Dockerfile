FROM golang:1.15-alpine AS build

WORKDIR /src/
COPY rocks.go go.* /src/
RUN CGO_ENABLED=0 go build -o /bin/rocks

FROM scratch
COPY --from=build /bin/rocks /bin/rocks
CMD ["/bin/rocks"]