#!/bin/bash

# Pull Newman image
docker pull postman/newman

# Get restapp IP address
restappIp=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' restapp)

# Run Postman collection with newman
docker run --rm \
    --add-host "restapp:$restappIp" \
    -v "$(pwd)/utils/tests:/etc/newman" \
    postman/newman run "tests/collectionRestAppTest.json" 
    # --environment "tests/env.json"
