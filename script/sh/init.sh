docker build -t travel-diary-proxy-server-project ../../project/
HOST_IP=10.12.204.27 docker-compose -f ../../project/docker-compose.yml up -d
