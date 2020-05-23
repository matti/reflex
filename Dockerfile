FROM golang:1.14-alpine as builder

WORKDIR /build
COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -tags netgo -ldflags '-w' -o reflex *.go

FROM scratch
COPY run.sh /
COPY --from=builder /build/reflex /
