#!/bin/bash 
docker ps -a | grep zhongjx/demonode | awk "{print \$1}"

docker ps -a | grep zhongjx/demonode | awk "{print \$1}" | xargs docker rm -f

docker images --filter=reference='*zhongjx/demonode:*' | awk "{print \$3}"

docker images --filter=reference='*zhongjx/demonode:*' | awk "{print \$3}" | xargs docker rmi -f
