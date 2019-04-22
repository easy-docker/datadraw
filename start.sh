#!/bin/sh
#ext-gd
docker run --rm --interactive --tty --volume $PWD:/app --volume $PWD/tmp:/tmp --user $(id -u):$(id -g) composer install