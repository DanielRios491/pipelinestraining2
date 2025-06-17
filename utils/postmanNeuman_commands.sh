#!/bin/bash

ENV=$1

if [ "$ENV" = "dev" ]; then
    PORT=5000
elif [ "$ENV" = "prod" ]; then
    PORT=5001
else
    echo "Invalid environment: $ENV"
    exit 1
fi

# Pull Newman image
docker pull postman/newman

# Get restapp IP address
restappIp=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "restapp-$ENV")

# Run Postman collection with newman
docker run --rm \
    --add-host "restapp:$restappIp" \
    -v "$(pwd)/utils/tests:/etc/newman" \
    postman/newman run "/etc/newman/collectionRestAppTest.json" \
    --env-var "base_url=http://restapp:$PORT"
