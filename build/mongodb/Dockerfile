# Upstream's deployments/mongo.Dockerfile (mongo:4.0.3 with upstream's mongo-init.js, which
# creates the API's database user), with the script copied from app/deployments/.
FROM docker.io/library/mongo:4.0.3

ADD app/deployments/mongo-init.js /docker-entrypoint-initdb.d/
