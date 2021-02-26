FROM golang:1.15-alpine AS build

WORKDIR /src/
COPY rocks.go /src/

RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /bin/rocks

FROM scratch
COPY --from=build /bin/rocks /bin/rocks
CMD ["/bin/rocks"]