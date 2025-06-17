#!/bin/bash

# Pull Newman image
docker pull postman/newman

# Get restapp IP address
restappIp=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' restapp-dev)

# Run Postman collection with newman
docker run --rm \
    --add-host "restapp-dev:$restappIp" \
    -v "$(pwd)/utils/tests:/etc/newman" \
    postman/newman run "/etc/newman/collectionRestAppTest.json" \
    --environment "/etc/newman/env.json"
