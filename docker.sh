#!/bin/sh

docker build -t dev-env .
docker run -it dev-env
