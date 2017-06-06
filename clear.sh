#!/bin/bash 
docker ps -a | grep zhongjx/demonode | awk "{print \$1}"

# docker ps -a | grep zhongjx/demonode | awk "{print \$1}" | xargs -r docker rm -f
docker ps -a | grep zhongjx/demonode | awk "{print \$1}" | xargs --no-run-if-empty docker rm -f

# docker images --filter=reference='*zhongjx/demonode:*' | awk "{print \$3}"

# docker images --filter=reference='*zhongjx/demonode:*' | awk "{print \$3}" | xargs --no-run-if-empty docker rmi -f

docker images | grep zhongjx/demonode| awk "{print \$3}" 

docker images | grep zhongjx/demonode| awk "{print \$3}" | xargs --no-run-if-empty docker rmi -f



# docker rm -f  $(docker ps -aq -f name='nodedemo')

# docker rmi -f $(docker images -q  -f reference='zhongjx/demonode')