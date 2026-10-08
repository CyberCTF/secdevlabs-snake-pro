# Upstream's deployments/api.Dockerfile with these changes: the base image is pinned to
# golang:1.23 (upstream: golang, i.e. latest; 1.23 was current at the secDevLabs commit); the
# sources are copied from app/app/ (upstream's build context is the app folder); SECRET_KEY from
# upstream's deployments/docker-compose.yml is baked in; the program is compiled once at build
# time so `go run` starts quickly and offline; and the compose command (`go run main.go`) is the
# CMD. The database settings come from upstream's app/config.yml, unchanged.
FROM docker.io/library/golang:1.23

WORKDIR /go/src/github.com/globocom/secDevLabs/owasp-top10-2021-apps/a2/snake-pro/app

COPY app/app/go.mod app/app/go.sum ./
RUN go mod download

COPY app/app/ ./

ENV SECRET_KEY=secret-key

RUN go build -o /dev/null .
CMD ["go", "run", "main.go"]
